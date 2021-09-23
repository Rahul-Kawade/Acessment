using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ContactMVC.Startup))]
namespace ContactMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
