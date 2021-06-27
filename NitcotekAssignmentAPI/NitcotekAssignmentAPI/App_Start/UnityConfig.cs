using NitcotekAssignmentBLL.Services.JournalEntryService;
using NitcotekAssignmentDAL.Repositories.JournalEntryRepo;
using System.Web.Http;
using Unity;
using Unity.WebApi;

namespace NitcotekAssignmentAPI
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer().AddExtension(new Diagnostic()); 

            // register all your components with the container here
            // it is NOT necessary to register your controllers
            container.RegisterType<IJournalEntryService, JournalEntryService>();
            container.RegisterType<IJournalEntryRepo, JournalEntryRepo>();
            // e.g. container.RegisterType<ITestService, TestService>();
            
            GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
        }
    }
}