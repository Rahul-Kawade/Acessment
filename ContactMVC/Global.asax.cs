using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace ContactMVC
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            //IWindsorContainer container = new WindsorContainer();
            //ControllerBuilder.Current.SetControllerFactory(new WindsorControllerFactory(container));

            //container.RegisterControllers(typeof(HomeController).Assembly);
            //container.AddComponent("logger", typeof(Compex.Web.Utilities.Logging.ILogger), typeof(MVCLog4NetLogger));

            //ServiceLocator.SetLocatorProvider(() => new WindsorServiceLocator(container));

        }
    }
}
