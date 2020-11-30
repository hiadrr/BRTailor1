using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BRTailor.Startup))]
namespace BRTailor
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
