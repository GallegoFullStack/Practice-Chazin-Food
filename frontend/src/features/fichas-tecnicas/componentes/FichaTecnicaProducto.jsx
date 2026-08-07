import { useState } from "react";
import { ChevronDown, ChevronUp, FileText, Search, Package, Plus, Minus, X } from "lucide-react";
import { useNotifications } from "@/shared/hooks/useNotifications";

const insumosDisponibles = [
  { id: 1, nombre: "Tomate", unidadMedida: "kg", categoria: "Verduras", precioUnitario: 3500 },
  { id: 2, nombre: "Lechuga", unidadMedida: "und", categoria: "Verduras", precioUnitario: 2000 },
  { id: 3, nombre: "Carne de Res", unidadMedida: "kg", categoria: "Proteínas", precioUnitario: 25000 },
  { id: 4, nombre: "Pan Hamburguesa", unidadMedida: "und", categoria: "Carbohidratos", precioUnitario: 8500 },
  { id: 5, nombre: "Queso Mozzarella", unidadMedida: "kg", categoria: "Lácteos", precioUnitario: 18000 }
];

export function FichaTecnicaProducto({ initialData, onSave }) {
  const notify = useNotifications();
  const [expanded, setExpanded] = useState(false);
  const [insumos, setInsumos] = useState(initialData?.insumos || []);
  const [procedimiento, setProcedimiento] = useState(initialData?.procedimiento || "");
  const [tiempoPreparacion, setTiempoPreparacion] = useState(initialData?.tiempoPreparacion || 0);
  const [rendimiento, setRendimiento] = useState(initialData?.rendimiento || "");
  const [observaciones, setObservaciones] = useState(initialData?.observaciones || "");
  const [searchInsumo, setSearchInsumo] = useState("");

  const agregarInsumo = (ins) => {
    setInsumos((prev) => [
      ...prev,
      { id: Date.now(), idInsumo: ins.id, nombreInsumo: ins.nombre, cantidad: 1, unidadMedida: ins.unidadMedida }
    ]);
    setSearchInsumo("");
  };

  const quitarInsumo = (id) => setInsumos((prev) => prev.filter((i) => i.id !== id));

  const handleSave = () => {
    if (onSave) {
      onSave({ insumos, procedimiento, tiempoPreparacion, rendimiento, observaciones });
      notify.success("Ficha Técnica Guardada", "La ficha técnica del producto se guardó correctamente");
    }
  };

  return (
    <div className="border-t border-gray-200 dark:border-gray-700 pt-4">
      <button
        type="button"
        onClick={() => setExpanded(!expanded)}
        className="w-full flex items-center justify-between mb-3 hover:bg-gray-50 dark:hover:bg-gray-800 p-3 rounded-lg transition-colors"
      >
        <div className="flex items-center gap-2">
          {expanded ? <ChevronUp className="w-5 h-5 text-gray-500" /> : <ChevronDown className="w-5 h-5 text-gray-500" />}
          <FileText className="w-5 h-5 text-red-500" />
          <h3 className="font-bold text-gray-800 dark:text-gray-100">Ficha Técnica</h3>
        </div>
      </button>

      {expanded && (
        <div className="space-y-6 bg-gray-50 dark:bg-gray-800/50 p-4 rounded-lg">
          <div>
            <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Ingredientes / Insumos</label>
            <input
              type="text"
              value={searchInsumo}
              onChange={(e) => setSearchInsumo(e.target.value)}
              placeholder="Buscar insumo..."
              className="w-full px-4 py-2 border rounded-xl dark:bg-gray-800 dark:text-gray-100 text-sm"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Procedimiento de Preparación</label>
            <textarea
              value={procedimiento}
              onChange={(e) => setProcedimiento(e.target.value)}
              rows={4}
              className="w-full px-4 py-2 border rounded-xl dark:bg-gray-800 dark:text-gray-100 text-sm"
            />
          </div>

          <div className="flex justify-end pt-2">
            <button
              type="button"
              onClick={handleSave}
              className="px-4 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600 transition-colors font-medium text-sm"
            >
              Guardar Ficha Técnica
            </button>
          </div>
        </div>
      )}
    </div>
  );
}