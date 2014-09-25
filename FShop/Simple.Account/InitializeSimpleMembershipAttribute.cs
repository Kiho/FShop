using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Threading;
using System.Web.Mvc;
using System.Web.Security;
using Simple.Account.Models;
using WebMatrix.WebData;

namespace Simple.Account
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public sealed class InitializeSimpleMembershipAttribute : ActionFilterAttribute
    {
        private static SimpleMembershipInitializer _initializer;
        private static object _initializerLock = new object();
        private static bool _isInitialized;

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            // WebSecurity.InitializeDatabaseConnection("AppDbContext", "UserProfile", "UserId", "UserName", false);
            // Ensure ASP.NET Simple Membership is initialized only once per app start
            LazyInitializer.EnsureInitialized(ref _initializer, ref _isInitialized, ref _initializerLock);
        }

        //public void Initialize()
        //{
        //    AppDomain.CurrentDomain.SetData(
        //        "DataDirectory", Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"..\..\..\FShop"));
        //    LazyInitializer.EnsureInitialized(ref _initializer, ref _isInitialized, ref _initializerLock);
        //}

        private class SimpleMembershipInitializer
        {
            public SimpleMembershipInitializer()
            {
                Database.SetInitializer<AppDbContext>(new CreateDatabaseIfNotExists<AppDbContext>()); 
                try
                {
                    using (var context = new AppDbContext())
                    {
                        if (!context.Database.Exists())
                        {
                            // Create the SimpleMembership database without Entity Framework migration schema
                            ((IObjectContextAdapter)context).ObjectContext.CreateDatabase();
                        }
                    }

                    if (!WebSecurity.Initialized)
                        WebSecurity.InitializeDatabaseConnection("AppDbContext",
                        "UserProfile", "UserId", "UserName", autoCreateTables: true);
                    var roles = (SimpleRoleProvider)Roles.Provider;
                    var membership = (SimpleMembershipProvider)Membership.Provider;

                    if (!roles.RoleExists("Admin"))
                    {
                        roles.CreateRole("Admin");
                    }
                    if (!roles.RoleExists("User"))
                    {
                        roles.CreateRole("User");
                    }
                    if (!WebSecurity.UserExists("Admin"))
                    {
                        WebSecurity.CreateUserAndAccount("Admin", "password", new { UserEmail = "test@gmail.com", IsActive = true });
                    }
                    if (!Roles.IsUserInRole("Admin", "Admin"))
                    {
                        try
                        {
                            Roles.AddUserToRole("Admin", "Admin");
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex.Message);
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new InvalidOperationException("The ASP.NET Simple Membership database could not be initialized. For more information, please see http://go.microsoft.com/fwlink/?LinkId=256588", ex);
                }
            }
        }
    }
}
