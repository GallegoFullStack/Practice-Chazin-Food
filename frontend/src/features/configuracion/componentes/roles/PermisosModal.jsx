import { useState, useEffect } from "react";
import { X, Shield, Check } from "lucide-react";

const TODOS_PERMISOS = [
  "Dashboard", "Compras", "Categoría Insumos", "Insumos", "Proveedores",
  "Gestión de Compras", "Producción", "Categoría Productos", "Productos",
  "Fichas Técnicas", "Gestión de Producción", "Ventas", "Clientes",
  "Gestión de Ventas", "Punto de Venta", "Configuración", "Usuarios", "Roles"
];

export function PermisosModal({ isOpen, onClose, onSave, rol }) {
  const [editingPermisos, setEditingPermisos] = useState([]);

  useEffect(() => {
    if (rol) {
      setEditingPermisos([...(rol.permisos || [])]);
    } else {
      setEditingPermisos([]);
    }
  }, [rol, isOpen]);

  if (!isOpen || !rol) return null;

  const togglePermiso = (permiso) => {
    setEditingPermisos((prev) =>
      prev.includes(permiso) ? prev.filter((p) => p !== permiso) : [...prev, permiso]
    );
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    onSave(editingPermisos);
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40 backdrop-blur-sm">
      <div className="bg-white dark:bg-gray-900 rounded-3xl shadow-2xl w-full max-w-lg overflow-hidden flex flex-col max-h-[90vh]">
        <div className="bg-gradient-to-r from-blue-600 to-indigo-600 p-5 sm:p-6 flex items-center justify-between text-white shrink-0">
          <div className="flex items-center gap-3.5">
            <div className="w-12 h-12 bg-white/20 backdrop-blur-md rounded-2xl flex items-center justify-center text-white shrink-0">
              <Shield className="w-6 h-6" />
            </div>
            <div>
              <h2 className="text-xl font-bold text-white leading-tight">{rol.nombre}</h2>
              <p className="text-xs text-white/80 mt-0.5">Editar permisos del rol</p>
            </div>
          </div>
          <button onClick={onClose} className="text-white/80 hover:text-white p-1.5 rounded-full hover:bg-white/10 transition-colors">
            <X className="w-5 h-5" />
          </button>
        </div>

        <form onSubmit={handleSubmit} className="flex-1 flex flex-col overflow-hidden">
          <div className="p-5 sm:p-6 flex-1 overflow-y-auto space-y-3">
            <p className="text-xs text-slate-500 dark:text-gray-400">
              {editingPermisos.length} de {TODOS_PERMISOS.length} permisos seleccionados
            </p>
            <div className="space-y-2.5">
              {TODOS_PERMISOS.map((perm) => {
                const checked = editingPermisos.includes(perm);
                return (
                  <div
                    key={perm}
                    onClick={() => togglePermiso(perm)}
                    className={`w-full flex items-center justify-between p-4 rounded-2xl border transition-all cursor-pointer select-none ${checked
                        ? "border-emerald-300 dark:border-emerald-700/60 bg-[#f0fdf4] dark:bg-emerald-950/20 text-emerald-900 dark:text-emerald-200"
                        : "border-slate-200 dark:border-gray-800 bg-slate-50 dark:bg-gray-800/40 text-slate-700 dark:text-gray-300"
                      }`}
                  >
                    <span className="text-sm font-medium">{perm}</span>
                    {checked ? (
                      <div className="w-7 h-7 rounded-full bg-[#00c853] text-white flex items-center justify-center shrink-0">
                        <Check className="w-4 h-4" />
                      </div>
                    ) : (
                      <div className="w-7 h-7 rounded-full bg-slate-200 dark:bg-gray-700 text-slate-400 flex items-center justify-center shrink-0">
                        <X className="w-4 h-4" />
                      </div>
                    )}
                  </div>
                );
              })}
            </div>
          </div>

          <div className="p-5 bg-white dark:bg-gray-900 border-t border-gray-100 dark:border-gray-800 flex items-center justify-center gap-4 shrink-0">
            <button
              type="button"
              onClick={onClose}
              className="px-6 py-2.5 rounded-2xl border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-800 text-slate-700 dark:text-gray-200 text-sm font-medium"
            >
              Cancelar
            </button>
            <button
              type="submit"
              className="px-6 py-2.5 rounded-2xl bg-[#F05454] hover:bg-[#d94444] text-white text-sm font-medium shadow-md flex items-center gap-2"
            >
              <Check className="w-4 h-4" />
              <span>Guardar Permisos</span>
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}