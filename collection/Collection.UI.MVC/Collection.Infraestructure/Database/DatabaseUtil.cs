using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Collection.Infraestructure.Database
{
    public class DatabaseUtil
    {
        /// <summary>
        /// Función que devuelve un objeto de tipo SQLConnection configurado con la cadena de conexión a la base de datos
        /// </summary>
        /// <returns>Retorn un SQLConnection</returns>
        public static IDbConnection CreateDbConnection()
        {
            //ConfigurationManager: Permite leer la configuraciones realizadas en los archivos de configuración
            //Web.config o App.config
            var connectionString = ConfigurationManager.ConnectionStrings["dbCollection"].ConnectionString;

            return new SqlConnection(connectionString);

        }
    }
}
