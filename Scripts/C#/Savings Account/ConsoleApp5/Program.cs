using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Console;
using static System.Array;

namespace Assignment5_SAVINGS
{
    class SavingsAccountTest
    {
        static void Main(string[] args)
        {  //initialize fields and objects
            SavingsAccount saver1 = new SavingsAccount(2000,"Saver_One");
            SavingsAccount saver2 = new SavingsAccount(3000, "Saver_Two");
            SavingsAccount saver3 = new SavingsAccount(); //this one is blank
            //set annual rate and then print 1
            SavingsAccount.setAnnualInterestRate(4);
            saver3.setSavingsAccountName("Saver_Three");
            saver3.setSavingsBalance(50000);
            WriteLine("Initial savings account balances: ");
            saver1.PrintSavingsAccount();
            saver2.PrintSavingsAccount();
            saver3.PrintSavingsAccount();
            //calculate method then print again..
            saver1.CalculateMonthlyInterest();
            saver2.CalculateMonthlyInterest();
            saver3.CalculateMonthlyInterest();
            WriteLine("\nSavings account balances after calculating monthly interest at 4%: ");
            saver1.PrintSavingsAccount();
            saver2.PrintSavingsAccount();
            saver3.PrintSavingsAccount();
            //update interest rate again and print for the last time
            SavingsAccount.setAnnualInterestRate(5);
              WriteLine("\nSavings Account balances after calculating monthly interest at 5%: ");
            saver1.PrintSavingsAccount();
            saver2.PrintSavingsAccount();
            saver3.PrintSavingsAccount();
            WriteLine("\nPress the [Enter] key to quit.");
            ReadLine();
        }
    }
}
