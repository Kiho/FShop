using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FShop.CreateDb
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                const string dbName = "BalloonShop";
                CreateDatabase(dbName);
                RunSQL(dbName);
                Console.WriteLine("Done.");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            Console.ReadKey();
        }

        static string GetAppPath()
        {
            string path = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace(@"file:\", "");
            return path;
        }

        static void CreateDatabase(string dbName)
        {
            string path = Path.Combine(GetAppPath(), @"..\..\..\FShop\FShopWebApi\App_Data");
            var connection = new SqlConnection(@"server=(localdb)\v11.0");
            using (connection)
            {
                connection.Open();

                string sql = string.Format(@"
                CREATE DATABASE
                    [{0}]
                ON PRIMARY (
                   NAME={0},
                   FILENAME = '{1}\{0}.mdf'
                )
                LOG ON (
                    NAME={0}_log,
                    FILENAME = '{1}\{0}_log.ldf'
                )",
                    dbName, path
                );

                var command = new SqlCommand(sql, connection);
                command.ExecuteNonQuery();
            }
        }

        static void RunSQL(string dbName)
        {
            string path = GetAppPath();
            string dbFilePath = Path.Combine(GetAppPath(), @"..\..\..\FShop\FShopWebApi\App_Data", dbName + ".mdf");
            string sqlConnectionString = string.Format(@"Data Source=(LocalDb)\v11.0;Initial Catalog={0};Integrated Security=TRUE;AttachDBFilename={1};",
                                            dbName, dbFilePath);
            
            RunSQL(path, "1-BalloonShop-CreateDB.sql", sqlConnectionString);
            RunSQL(path, "2-BalloonShop-Insert-Data.sql", sqlConnectionString);            
        }

        private static void RunSQL(string path, string file, string sqlConnectionString)
        {
            var cmds = new List<string>();
            string filePath = Path.Combine(path, file);
            if (File.Exists(filePath))
            {
                using (TextReader tr = new StreamReader(filePath))
                {
                    string line = "";
                    string cmd = "";
                    while ((line = tr.ReadLine()) != null)
                    {
                        if (line.Trim().ToUpper() == "GO")
                        {
                            cmds.Add(cmd);
                            cmd = "";
                        }
                        else
                        {
                            cmd += line + "\r\n";
                        }
                    }
                    if (cmd.Length > 0)
                    {
                        cmds.Add(cmd);
                    }
                }               
            }

            if (cmds.Count > 0)
            {
                var command = new SqlCommand();
                command.Connection = new SqlConnection(sqlConnectionString);
                command.CommandType = System.Data.CommandType.Text;
                command.Connection.Open();
                foreach (string cmd in cmds)
                {
                    Console.WriteLine("EXECUTE COMMAND: " + cmd);
                    command.CommandText = cmd;
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
