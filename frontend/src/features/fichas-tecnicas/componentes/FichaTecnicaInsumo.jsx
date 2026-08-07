import { useState } from "react";
import { ChevronDown, FileText } from "lucide-react";
import { useNotifications } from "@/shared/hooks/useNotifications";

export function FichaTecnicaInsumo({ insumoId, insumoName, initialData, onSave }) {
  const notify = useNotifications();
  const [expanded, setExpanded] = useState(false);
  const [especificaciones, setEspecificaciones] = useState(initialData?.especificaciones || "");
  const [caracteristicas, setCaracteristicas] = useState(initialData?.caracteristicas || "");

  const handleSave = () => {
    if (onSave) {
      onSave({ especificaciones, caracteristicas });
      notify.success("Ficha Técnica Guardada", "La ficha técnica del insumo se guardó correctamente");
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
          <ChevronDown className={`w-5 h-5 text-gray-500 transition-transform ${expanded ? "rotate-180" : ""}`} />
          <FileText className="w-5 h-5 text-red-500" />
          <h3 className="font-bold text-gray-800 dark:text-gray-100">Ficha Técnica de Insumo</h3>
        </div>
      </button>

      {expanded && (
        <div className="space-y-6 bg-gray-50 dark:bg-gray-800/50 p-4 rounded-lg">
          <div>
            <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Especificaciones Técnicas</label>
            <textarea
              value={especificaciones}
              onChange={(e) => setEspecificaciones(e.target.value)}
              rows={3}
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