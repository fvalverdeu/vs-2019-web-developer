using Collection.Application.DTO.Clients;
using Collection.Application.Interfaces.Queries;
using Collection.Application.Interfaces.Repositories;
using Collection.Application.Interfaces.UseCases;
using Collection.Domain.Client;
using Collection.Infraestructure.Repositories;
using Collection.UI.MVC.Helpers;
using Collection.UI.MVC.Models;
using ExcelDataReader;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Collection.UI.MVC.Areas.Administrator.Controllers
{
    public class ClientController : Controller
    {
        private readonly IClientQuery _clientQuery;
        private readonly IClientRepository _clientRepository;
        private readonly IClientUseCase clientUseCase;
        public ActionResult Error()
        {
            throw new System.Exception("Ocurrió un error");
        }

        public ClientController(IClientQuery clientQuery, IClientRepository clientRepository, IClientUseCase clientUseCase)
        {
            _clientQuery = clientQuery;
            _clientRepository = clientRepository;
            this.clientUseCase = clientUseCase;
        }

        // GET: Client
        public ActionResult Index()
        {
            var model = _clientQuery.GetAllClients();
            return View(model);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(ClientViewModel model)
        {
            if (ModelState.IsValid)
            {
                //_clientRepository.Add<int>(client);
                //return RedirectToAction("Index");
                var retorno = true;
                var client = new Client();
                client = Mappers.ClientViewModelToClientMapping().Map(model, client);
                retorno = clientUseCase.Register(client) > 0;
            }
            //return Json(retorno);
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            return View(_clientRepository.Get(id));
        }

        [HttpPost]
        public ActionResult Edit(ClientViewModel model)
        {
            var client = new Client();
            client = Mappers.ClientViewModelToClientMapping().Map(model, client);
            if (clientUseCase.Update(client)) return RedirectToAction("Index");
            return View(client);
        }

        public ActionResult Details(int id)
        {
            return View(_clientRepository.Get(id));
        }

        public ActionResult Delete(int id)
        {
            return View(_clientRepository.Get(id));
        }

        [HttpPost]
        [ActionName("Delete")]
        public ActionResult DeletePost(int id)
        {
            Client client = new Client();
            client = _clientRepository.Get(id);

            if (clientUseCase.Remove(client))
            {
                return RedirectToAction("Index");
            }
            return View(client);
        }

        public ActionResult LoadClients()
        {
            List<Client> list = new List<Client>();
            return View(list);
        }

        [HttpPost]
        public ActionResult LoadClients(HttpPostedFileBase fileBase, string command)
        {
            List<Client> list = new List<Client>();
            if (fileBase == null && command.Equals("Cargar"))
            {
                return RedirectToAction("Index");
            }
            else
            {
                if (command.Equals("Cargar"))
                {
                    if (!fileBase.FileName.EndsWith(".xls") && !fileBase.FileName.EndsWith(".xlsx"))
                    {
                        return View();
                    }
                    var fileName = DateTime.Now.ToString("yyyyMMddHHmm.") +
                        fileBase.FileName.Split(new[] { '.' }, StringSplitOptions.RemoveEmptyEntries).Last();
                    Session.Add("FileName", fileName); 
                    SaveFile(fileBase, fileName);

                    list = GetListClients(fileName);

                    return View(list);
                } else
                {
                    string fileName = Session["FileName"].ToString();
                    list = GetListClients(fileName);
                    SaveClients(list);
                    DeleteFile();
                    return RedirectToAction("Index");
                }
                
            }
        }

        private void SaveFile(HttpPostedFileBase fileBase, string fileName)
        {
            var path = Path.Combine(Server.MapPath("~/Content/Files"), fileName);
            var data = new byte[fileBase.ContentLength];
            fileBase.InputStream.Read(data, 0, fileBase.ContentLength);

            using (var sw = new FileStream(path, FileMode.Create))
            {
                sw.Write(data, 0, data.Length);
            }
        }

        private void DeleteFile()
        {
            var path = Path.Combine(Server.MapPath("~/Content/Files"));
            DirectoryInfo directoryInfo = new DirectoryInfo(path);
            foreach (FileInfo file in directoryInfo.GetFiles())
            {
                file.Delete();
            }
        }

        private List<Client> GetListClients(string fileName)
        {
            List<Client> clients = new List<Client>();
            using (var stream = System.IO.File.Open(Path.Combine(Server.MapPath("~/Content/Files"), fileName), FileMode.Open, FileAccess.Read))
            {
                using (IExcelDataReader reader = ExcelReaderFactory.CreateReader(stream))
                {
                    DataSet dataset = reader.AsDataSet(new ExcelDataSetConfiguration()
                    {
                        ConfigureDataTable = (_) => new ExcelDataTableConfiguration() { UseHeaderRow = true }
                    });
                    foreach (DataRow dataRow in dataset.Tables[0].Rows)
                    {
                        Client client = new Client();
                        client.Dni = dataRow["Dni"].ToString();
                        client.Ruc = dataRow["Ruc"].ToString();
                        client.Name = dataRow["Name"].ToString();
                        client.LastName = dataRow["LastName"].ToString();
                        client.BirthDate = DateTime.Parse(dataRow["BirthDate"].ToString());
                        client.Phone = dataRow["Phone"].ToString();
                        client.Address = dataRow["Address"].ToString();
                        client.Email = dataRow["Email"].ToString();
                        client.Account = dataRow["Account"].ToString();
                        client.Amount = Decimal.Parse(dataRow["Amount"].ToString());
                        client.Debt = Decimal.Parse(dataRow["Debt"].ToString());
                        client.ExpirationDate = DateTime.Parse(dataRow["ExpirationDate"].ToString());
                        client.FeeNumber = int.Parse(dataRow["FeeNumber"].ToString());
                        client.UserId = int.Parse(dataRow["UserId"].ToString());
                        clients.Add(client);
                    }
                }
            }
            return clients;
        }

        private void SaveClients(List<Client> clients)
        {
            foreach (Client client in clients)
            {
                clientUseCase.Register(client);
            }
        }
    }
}