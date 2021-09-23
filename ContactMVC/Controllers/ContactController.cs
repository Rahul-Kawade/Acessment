using ContactMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;


namespace ContactMVC.Controllers
{
    public class ContactController : Controller
    {
        // GET: Contact
        public ActionResult Index()
        {
            IEnumerable<mvcContactModel> contactList;
            HttpResponseMessage resonse = GlobalVariables.WebApiClient.GetAsync("ContactDetails").Result;
            contactList = resonse.Content.ReadAsAsync<IEnumerable<mvcContactModel>>().Result;
            return View(contactList);
        }
        public ActionResult AddOrEdit(int id = 0)
        {
            if (id == 0)
            {
                return View(new mvcContactModel());
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("ContactDetails/" + id.ToString()).Result;
                return View(response.Content.ReadAsAsync<mvcContactModel>().Result);
            }
        }

        [HttpPost]
        public ActionResult AddOrEdit(mvcContactModel conta)
        {
            if (conta.Contactid == 0)
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PostAsJsonAsync("ContactDetails", conta).Result;
                TempData["SuccessMessage"] = "Saved Successfully";
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PutAsJsonAsync("ContactDetails", conta.Contactid).Result;
                TempData["SuccessMessage"] = "Updated Successfully";
            }
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            HttpResponseMessage response = GlobalVariables.WebApiClient.DeleteAsync("ContactDetails/" + id.ToString()).Result;
            TempData["SuccessMessage"] = "Deleted Successfully";
            return RedirectToAction("Index");
        }
    }
}