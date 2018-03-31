using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using CSE411_Project;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace UnitTest
{
    [TestFixture]
    public class Class1
    {
        DataAccess da = null;

        [SetUp]
        public void TestSetup()
        {
           da = new DataAccess();
        }

        [Test]
        [Category("Database")]
        public void ConnectAndDisconnectFromDatabase()
        {
           
            bool connected = da.Connect();
            bool disconnected = da.Disconnect();

            Assert.IsTrue(connected);
            Assert.IsTrue(disconnected);
        }

         [TearDown]
        public void TearDown()
        {
            da = null;
        }

         [Test]
         [Category("Database")]

         public void InsertCustomerIntoDatabase()
         {
          
            Customer ca = new Customer();
            bool inserted= ca.insertCustomer("CustomerTest", "Customer", "123", "Customer@Test.com");
            
             da.Disconnect();
             Assert.IsTrue(inserted);
         }


        [Test]
        public void InsertCustomerIntoDatabaseCheckBlank()  //Check blank
        {
            
            Customer ca = new Customer();
            bool inserted = ca.insertCustomer("", "CustomerTest", "123", "Customer@Test.com");


            da.Disconnect();
            Assert.IsFalse(inserted);
        }

        [Test]
      [Category("Database")]
      public void UpdateCustomerTest()
      {
          // DataAccess da = new DataAccess();
          Customer ca = new Customer();
          da.Connect();


          bool inserted = ca.insertCustomer("Customertestupdate", "Customer", "000", "Customer@Testupdate.com");
          if (inserted)
          {
              SqlCommand command = new SqlCommand("SELECT TOP(1) CUST_ID FROM CUSTOMER ORDER BY 1 DESC", da.conn);
             // command.Parameters.AddWithValue("@mail", "Customer@Testupdate.com");
              // command.ExecuteNonQuery();
              int primaryKey = Convert.ToInt32(command.ExecuteScalar());
              bool updated = ca.updateCustomer(primaryKey, "CustomerUpdated", "CustomerTest", "222", "Customer@Testupdate.com");
              bool updated2 = ca.updateCustomer(primaryKey, "", "CustomerTest", "222", "Customer@Testupdate.com");

                Assert.IsTrue(updated);
               Assert.IsFalse(updated2);


                da.Disconnect();


          }
      }





       
        [Test]
        [Category("Database")]

        public void DeleteCustomer()
        {
            // DataAccess da = new DataAccess();
            Customer ca = new Customer();
            Customer c = new Customer();
            da.Connect();
            bool inserted = ca.insertCustomer("Customer Test delete", "Customer Test2", "000", "Customer@Testdelete.com");


            if (inserted)
            {
                SqlCommand command = new SqlCommand("SELECT TOP(1) CUST_ID FROM CUSTOMER ORDER BY 1 DESC", da.conn);
               // command.Parameters.AddWithValue("@mail", "Customer@Testdelete.com");
                // command.ExecuteNonQuery();
                int primaryKey = Convert.ToInt32(command.ExecuteScalar());
                bool deleted = ca.deleteCustomer(primaryKey);

                // Customer c2 = da.GetCustomer(name);

                da.Disconnect();

                //  Assert.IsNull(c2);
                Assert.IsTrue(deleted);
            }
        }

        [Test]
        public void GetCustomerCheck()
        {
            Customer ca = new Customer();
            da.Connect();
            bool inserted = ca.insertCustomer("getCustomerCheck", "Customer Test2", "666", "Customer@TestGet.com");


            if (inserted)
            {
                DataTable datalist = new DataTable();
                datalist = ca.getCustomers();
                int count = datalist.Rows.Count;
                Assert.AreNotEqual(0, count);
            }
            
        }

        [Test]
        public void searchProductCheck()
        {
            Customer ca = new Customer();
            da.Connect();
         
           
                DataTable datalist = new DataTable();
                datalist = ca.searchProducts("rice");
                int count = datalist.Rows.Count;
                Assert.AreEqual(1, count);
            

        }

        [Test]
        public void IfAnyCustomerFieldNullThrowArgumentException()
        {
            string name = null;

            Customer ca = new Customer();
            da.Connect();
          // bool inserted = ca.insertCustomer(null, "CustomerTest", "666", "Customer@TestGet.com");

           Assert.Throws<ArgumentNullException>(() => ca.insertCustomer(name, "Customer Test2", "666", "Customer@TestGet.com"));
          //  Assert.Fail("If we get here, an exception hasn't been thrown");
        }


        [Test]
        [Category("Database")]
        public void IfProductNotFound()
        {
            da.Connect();
            DataTable d = new DataTable();
            Customer ca = new Customer();
            d = ca.searchProducts("UnknownProduct");
            int count = d.Rows.Count;
            da.Disconnect();
            Assert.AreEqual(0,count);
        }


        [Test]
        [Category("Database")]
        public void checkStringContainOnlyLetter()
        {
            string test = "aziza";
            string test2 = "a2b3";
            Customer ca = new Customer();
            bool res = ca.checkStringOnlyLetter(test);
            bool res2 = ca.checkStringOnlyLetter(test2);

            Assert.IsTrue(res);
            Assert.IsFalse(res2);

        }

        [Test]
        [Category("Database")]
        public void checkStringContainOnlyNumeric()
        {
            string test = "123123";
            string test2 = "a2b3";
            Customer ca = new Customer();
            bool res = ca.checkStringOnlyNumeric(test);
            bool res2 = ca.checkStringOnlyNumeric(test2);

            Assert.IsTrue(res);
            Assert.IsFalse(res2);

        }


    }
}
