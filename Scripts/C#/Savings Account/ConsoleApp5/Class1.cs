using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Console;

namespace Assignment5_SAVINGS
{
    class SavingsAccount
    {
        public static double annualinterestRate = 0.04;
        private double savingsBalance;
        private string savingsAccountName;

        //first constr
        public SavingsAccount()
        {
            //by default an empty constructor sets balance to zero and string to empty

        }
        //second constructor
        public SavingsAccount(double savingsBalance, string savingsAccountName)
        {
            setSavingsBalance(savingsBalance);
            setSavingsAccountName(savingsAccountName);
        }
        //mutator method
        public void setSavingsAccountName(string savingsAccountName)
        {
            this.savingsAccountName = savingsAccountName;
        }
        //accessor
        public string getSavingsAccountName()
        {
            return savingsAccountName;
        }
        //mutatormethod
        public void setSavingsBalance(double savingsBalance)
        {
            this.savingsBalance = savingsBalance;
        }

        public void CalculateMonthlyInterest()
        {
            savingsBalance +=((savingsBalance * annualinterestRate) / 12);
        }

        public static void setAnnualInterestRate(double aiR)
        {
            annualinterestRate = aiR / 100;
        }

        public void PrintSavingsAccount()
        {
            WriteLine("{0}       {1}         {2:C} ",  savingsAccountName, savingsBalance,string.Format("{0:0.00}",annualinterestRate));

        }



    }
}