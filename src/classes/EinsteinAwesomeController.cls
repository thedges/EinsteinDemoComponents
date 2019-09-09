public class EinsteinAwesomeController {  

    @AuraEnabled
    public static string getLeadStuff(String leadid) {
        Lead leadyay = [select name, title, company, city, escore__c, CustomL__c,
        Indicator_1_Positive__c, Top_Predictive_1__c, Top_Predictive_Result_1__c, Indicator_1_Strength__c,  
        Indicator_2_Positive__c, Top_Predictive_2__c, Top_Predictive_Result_2__c, Indicator_2_Strength__c,
        Indicator_3_Positive__c, Top_Predictive_3__c, Top_Predictive_Result_3__c, Indicator_3_Strength__c,
        Indicator_4_Positive__c, Top_Predictive_4__c, Top_Predictive_Result_4__c, Indicator_4_Strength__c,
        Indicator_5_Positive__c, Top_Predictive_5__c, Top_Predictive_Result_5__c, Indicator_5_Strength__c  from Lead where Id = :leadid];
        
        String namey = leadyay.name + '#*#' + leadyay.title + '#*#' + leadyay.company + '#*#' + leadyay.city + '#*#' + leadyay.escore__c + '#*#' + leadyay.Indicator_1_Positive__c + '#*#' + leadyay.Top_Predictive_1__c + '#*#' + leadyay.Top_Predictive_Result_1__c + '#*#' + leadyay.Indicator_2_Positive__c + '#*#' + leadyay.Top_Predictive_2__c + '#*#' + leadyay.Top_Predictive_Result_2__c + '#*#' + leadyay.Indicator_3_Positive__c + '#*#' + leadyay.Top_Predictive_3__c + '#*#' + leadyay.Top_Predictive_Result_3__c + '#*#' + leadyay.Indicator_4_Positive__c + '#*#' + leadyay.Top_Predictive_4__c + '#*#' + leadyay.Top_Predictive_Result_4__c + '#*#' + leadyay.Indicator_5_Positive__c + '#*#' + leadyay.Top_Predictive_5__c + '#*#' + leadyay.Top_Predictive_Result_5__c + '#*#' + leadyay.CustomL__c + '#*#' + leadyay.Indicator_1_Strength__c + '#*#' + leadyay.Indicator_2_Strength__c + '#*#' + leadyay.Indicator_3_Strength__c + '#*#' + leadyay.Indicator_4_Strength__c + '#*#' + leadyay.Indicator_5_Strength__c;
        return namey;
    }
    
    
    @AuraEnabled
    public static string getOpptyStuff(String opptyid) {
        Opportunity opptyay = [select Account.name, CloseDate,
        Last_Activity_Text__c, Last_Activity_Type__c, Last_Activity_Subject__c,
        Name_of_Contact__c, Competitor_they_Mentioned__c,
        Slowing_Reason__c, Boosting_Reason__c, Name from Opportunity where Id = :opptyid];
        
        string datetimestr =  opptyay.CloseDate.format();  
        
        String namey = opptyay.Account.name + '#*#' + datetimestr + '#*#' + opptyay.Last_Activity_Subject__c + '#*#' + opptyay.Last_Activity_Text__c + '#*#' + opptyay.Last_Activity_Type__c + '#*#' + opptyay.Name_of_Contact__c + '#*#' + opptyay.Competitor_they_Mentioned__c + '#*#' + opptyay.Slowing_Reason__c + '#*#' + opptyay.Boosting_Reason__c + '#*#' + opptyay.Name; 
        return namey;
    }
    
    @AuraEnabled
    public static string getMoreOpptyStuff(String opptyid) {
        Opportunity opptyay = [select Account.name, CloseDate,
        Last_Activity_Text__c, Last_Activity_Type__c, Last_Activity_Subject__c,
        Winning_Unlikely__c, Prospect_Unresponsive__c, 
        Competitor_Mentioned__c, Name_of_Contact__c, Competitor_they_Mentioned__c,
        Deal_Slowing__c, Slowing_Reason__c, Deal_boosting__c, Boosting_Reason__c,
        Time_Consuming_Oppty__c, No_Communication__c, Re_engaged__c, Task_Overdue__c, 
        Email_Subject__c, Email_Body__c,  
        Contact_to_email__c, Contact_to_email__r.name, Contact_to_email__r.email  from Opportunity where Id = :opptyid];
        
        string datetimestr =  opptyay.CloseDate.format();  
    

        
        String namey = opptyay.Account.name + '#*#' + datetimestr + '#*#' + opptyay.Last_Activity_Subject__c + '#*#' + opptyay.Last_Activity_Text__c + '#*#' + opptyay.Last_Activity_Type__c + '#*#' + opptyay.Winning_Unlikely__c + '#*#' + opptyay.Prospect_Unresponsive__c + '#*#' + opptyay.Competitor_Mentioned__c + '#*#' + opptyay.Name_of_Contact__c + '#*#' + opptyay.Competitor_they_Mentioned__c + '#*#' + opptyay.Deal_Slowing__c + '#*#' + opptyay.Slowing_Reason__c + '#*#' + opptyay.Deal_boosting__c + '#*#' + opptyay.Boosting_Reason__c + '#*#' + opptyay.Time_Consuming_Oppty__c + '#*#' + opptyay.No_Communication__c + '#*#' + opptyay.Re_engaged__c + '#*#' + opptyay.Task_Overdue__c + '#*#' + opptyay.Email_Subject__c + '#*#' + opptyay.Email_Body__c + '#*#' + opptyay.Contact_to_email__c + '#*#' + opptyay.Contact_to_email__r.name + '#*#' + opptyay.Contact_to_email__r.email;
        return namey;
    }
    
    @AuraEnabled
    public static string getAccountStuff(String accountid) {
        Account acctyay = [select name, Einstein_Account_Insights__c,
        Einstein_Article_1_Title__c, Einstein_Article_2_Title__c, Einstein_Article_3_Title__c,
        Einstein_Article_1_Source__c, Einstein_Article_2_Source__c, Einstein_Article_3_Source__c,
        Einstein_Article_1_Date__c, Einstein_Article_2_Date__c, Einstein_Article_3_Date__c,
        Einstein_Article_1_URL__c, Einstein_Article_2_URL__c, Einstein_Article_3_URL__c from Account where Id = :accountid];
         
        Date articleDate1 = acctyay.Einstein_Article_1_Date__c;
        if(articleDate1 == null){
            articleDate1 = Date.today();
        }
        Date articleDate2 = acctyay.Einstein_Article_2_Date__c;
        if(articleDate2 == null){
            articleDate2 = Date.today();
        }
        Date articleDate3 = acctyay.Einstein_Article_3_Date__c;
        if(articleDate3 == null){
            articleDate3 = Date.today();
        }
        Date todayDate = Date.today();
        Integer daysbetween1 = articleDate1.daysBetween(todayDate);
        Integer daysbetween2 = articleDate2.daysBetween(todayDate);
        Integer daysbetween3 = articleDate3.daysBetween(todayDate);
                    
        String namey = acctyay.name + '#*#' + acctyay.Einstein_Account_Insights__c + '#*#' + acctyay.Einstein_Article_1_Title__c + '#*#' + daysbetween1 + '#*#' + acctyay.Einstein_Article_1_Source__c + '#*#' + acctyay.Einstein_Article_1_URL__c + '#*#' + acctyay.Einstein_Article_2_Title__c + '#*#' + daysbetween2 + '#*#' + acctyay.Einstein_Article_2_Source__c + '#*#' + acctyay.Einstein_Article_2_URL__c + '#*#' + acctyay.Einstein_Article_3_Title__c + '#*#' + daysbetween3 + '#*#' + acctyay.Einstein_Article_3_Source__c + '#*#' + acctyay.Einstein_Article_3_URL__c;
        return namey;
    }
    
    @AuraEnabled
    public static string getHomeLeadStuff(String emailis) {
        Lead leadyay = [select name, title, company, city, escore__c, CustomL__c,
        Indicator_1_Positive__c, Top_Predictive_1__c, Top_Predictive_Result_1__c, Indicator_1_Strength__c,  
        Indicator_2_Positive__c, Top_Predictive_2__c, Top_Predictive_Result_2__c, Indicator_2_Strength__c,
        Indicator_3_Positive__c, Top_Predictive_3__c, Top_Predictive_Result_3__c, Indicator_3_Strength__c,
        Indicator_4_Positive__c, Top_Predictive_4__c, Top_Predictive_Result_4__c, Indicator_4_Strength__c,
        Indicator_5_Positive__c, Top_Predictive_5__c, Top_Predictive_Result_5__c, Indicator_5_Strength__c, Id  from Lead where Email = :emailis];
        
        String namey = leadyay.name + '#*#' + leadyay.title + '#*#' + leadyay.company + '#*#' + leadyay.city + '#*#' + leadyay.escore__c + '#*#' + leadyay.Indicator_1_Positive__c + '#*#' + leadyay.Top_Predictive_1__c + '#*#' + leadyay.Top_Predictive_Result_1__c + '#*#' + leadyay.Indicator_2_Positive__c + '#*#' + leadyay.Top_Predictive_2__c + '#*#' + leadyay.Top_Predictive_Result_2__c + '#*#' + leadyay.Indicator_3_Positive__c + '#*#' + leadyay.Top_Predictive_3__c + '#*#' + leadyay.Top_Predictive_Result_3__c + '#*#' + leadyay.Indicator_4_Positive__c + '#*#' + leadyay.Top_Predictive_4__c + '#*#' + leadyay.Top_Predictive_Result_4__c + '#*#' + leadyay.Indicator_5_Positive__c + '#*#' + leadyay.Top_Predictive_5__c + '#*#' + leadyay.Top_Predictive_Result_5__c + '#*#' + leadyay.CustomL__c + '#*#' + leadyay.Indicator_1_Strength__c + '#*#' + leadyay.Indicator_2_Strength__c + '#*#' + leadyay.Indicator_3_Strength__c + '#*#' + leadyay.Indicator_4_Strength__c + '#*#' + leadyay.Indicator_5_Strength__c + '#*#' + leadyay.Id;
        return namey;
    }
    
    
    @AuraEnabled
    public static string getHomeOpptyStuff(String nameis) {
        Opportunity opptyay = [select Account.name, CloseDate,
        Last_Activity_Text__c, Last_Activity_Type__c, Last_Activity_Subject__c,
        Name_of_Contact__c, Competitor_they_Mentioned__c,
        Slowing_Reason__c, Boosting_Reason__c, Name, Id from Opportunity where Name = :nameis];
        
        string datetimestr =  opptyay.CloseDate.format();  
        
        String namey = opptyay.Account.name + '#*#' + datetimestr + '#*#' + opptyay.Last_Activity_Subject__c + '#*#' + opptyay.Last_Activity_Text__c + '#*#' + opptyay.Last_Activity_Type__c + '#*#' + opptyay.Name_of_Contact__c + '#*#' + opptyay.Competitor_they_Mentioned__c + '#*#' + opptyay.Slowing_Reason__c + '#*#' + opptyay.Boosting_Reason__c + '#*#' + opptyay.Name + '#*#' + opptyay.Id; 
        return namey;
    }
    
    @AuraEnabled
    public static string getHomeAccountStuff(String nameis) {
        Account acctyay = [select name, Einstein_Account_Insights__c,
        Einstein_Article_1_Title__c, Einstein_Article_2_Title__c, Einstein_Article_3_Title__c,
        Einstein_Article_1_Source__c, Einstein_Article_2_Source__c, Einstein_Article_3_Source__c,
        Einstein_Article_1_Date__c, Einstein_Article_2_Date__c, Einstein_Article_3_Date__c,
        Einstein_Article_1_URL__c, Einstein_Article_2_URL__c, Einstein_Article_3_URL__c, Id from Account where Name = :nameis];
         
        Date articleDate1 = acctyay.Einstein_Article_1_Date__c;
        if(articleDate1 == null){
            articleDate1 = Date.today();
        }
        Date articleDate2 = acctyay.Einstein_Article_2_Date__c;
        if(articleDate2 == null){
            articleDate2 = Date.today();
        }
        Date articleDate3 = acctyay.Einstein_Article_3_Date__c;
        if(articleDate3 == null){
            articleDate3 = Date.today();
        }
        Date todayDate = Date.today();
        Integer daysbetween1 = articleDate1.daysBetween(todayDate);
        Integer daysbetween2 = articleDate2.daysBetween(todayDate);
        Integer daysbetween3 = articleDate3.daysBetween(todayDate);
                    
        String namey = acctyay.name + '#*#' + acctyay.Einstein_Account_Insights__c + '#*#' + acctyay.Einstein_Article_1_Title__c + '#*#' + daysbetween1 + '#*#' + acctyay.Einstein_Article_1_Source__c + '#*#' + acctyay.Einstein_Article_1_URL__c + '#*#' + acctyay.Einstein_Article_2_Title__c + '#*#' + daysbetween2 + '#*#' + acctyay.Einstein_Article_2_Source__c + '#*#' + acctyay.Einstein_Article_2_URL__c + '#*#' + acctyay.Einstein_Article_3_Title__c + '#*#' + daysbetween3 + '#*#' + acctyay.Einstein_Article_3_Source__c + '#*#' + acctyay.Einstein_Article_3_URL__c + '#*#' + acctyay.Id;
        return namey;
    }
}