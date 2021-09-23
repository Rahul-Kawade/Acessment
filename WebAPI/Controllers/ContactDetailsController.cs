using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    public class ContactDetailsController : ApiController
    {
        private ContactsDBEntitiesDBModel db = new ContactsDBEntitiesDBModel();

        // GET: api/ContactDetails
        public IQueryable<ContactDetail> GetContactDetails()
        {
            return db.ContactDetails;
        }

        // GET: api/ContactDetails/5
        [ResponseType(typeof(ContactDetail))]
        public IHttpActionResult GetContactDetail(int id)
        {
            ContactDetail contactDetail = db.ContactDetails.Find(id);
            if (contactDetail == null)
            {
                return NotFound();
            }

            return Ok(contactDetail);
        }

        // PUT: api/ContactDetails/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutContactDetail(int id, ContactDetail contactDetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != contactDetail.Contactid)
            {
                return BadRequest();
            }

            db.Entry(contactDetail).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ContactDetailExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/ContactDetails
        [ResponseType(typeof(ContactDetail))]
        public IHttpActionResult PostContactDetail(ContactDetail contactDetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ContactDetails.Add(contactDetail);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = contactDetail.Contactid }, contactDetail);
        }

        // DELETE: api/ContactDetails/5
        [ResponseType(typeof(ContactDetail))]
        public IHttpActionResult DeleteContactDetail(int id)
        {
            ContactDetail contactDetail = db.ContactDetails.Find(id);
            if (contactDetail == null)
            {
                return NotFound();
            }

            db.ContactDetails.Remove(contactDetail);
            db.SaveChanges();

            return Ok(contactDetail);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ContactDetailExists(int id)
        {
            return db.ContactDetails.Count(e => e.Contactid == id) > 0;
        }
    }
}