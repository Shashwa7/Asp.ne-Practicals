using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace WebFormExp3
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        protected void Application_Error(object sender, EventArgs e)
        {
            HttpException lastErrorWraper = Server.GetLastError() as HttpException;

            if (lastErrorWraper.GetHashCode() == 404)
                Server.Transfer("~/ErrorPage.html");

            /*
                The first line is the Application_Error event handler. This event is called whenever an error occurs in an application. 
                Note that the event name has to be 'Application_Error'. And the parameters should be as shown above.
                Next, we define an object of the class type HttpException. 
                This is a standard object which will hold all the details of the error. 
                We then use the Server.GetLastError method to get all the details of the last error which occurred in the application.
                We then check if the error code of the last error is 404.
                (The error code 404 is the standard code returned when a user browses to a page which is not found).
                We then transfer the user to the ErrorPage.html page if the error code matches.
             */
        }
    }
    
}