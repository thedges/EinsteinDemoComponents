({
    doInit : function(component, event, helper) {
        component.set('v.cardLabel','Einstein Insights');
        
        let insights = [];
        for(let i = 1; i < 7; i++){
            let insight = component.get('v.oppi' + i + "_insight");
            let record = component.get('v.oppi' + i + "_id");
            if(record == null) record = "Commercial Loan $2M";
            let objectType = '';
            let recordName = record.split("-")[0];
            let insightTitle = "";
            let insightSubtitle = "";
            let insightSubtitle2 = "";
            let articles = [];
            let trend = "neutral"
            
            console.log(record);
            
            if(insight.startsWith('Acct')) objectType = "Account";
            if(insight.startsWith('Oppty')) objectType = "Opportunity";
            
            if(record && record != "" && record != "name here"){
                switch (insight){
                    case 'Acct - Merger and Acquisition':
                        insightTitle = "M&A activity detected for " + recordName;
                        insightSubtitle = "Here are 3 articles about " + recordName + " and merger and acquisition activity.";
                        trend = "neutral";
                        break;
                        
                    case 'Acct - Company Expanding':
                        insightTitle = recordName + " is expanding";
                        insightSubtitle = "Here are 3 articles about " + recordName + " expansion.";
                        trend = "up";
                        break;
                        
                    case 'Acct - Company Cost Cutting':
                        insightTitle = recordName + " is cutting costs";
                        insightSubtitle ="Here are 3 articles about " + recordName + " and cost-cutting measures.";
                        trend = "down";
                        break;
                        
                    case 'Acct - Leadership Change':
                        insightTitle = "Leadership changes at " + recordName;
                        insightSubtitle = "Here are 3 articles about changes to the executive leadership at " + recordName + ".";
                        trend = "neutral";
                        break;
                        
                    case 'Acct - Prospect Unresponsive':
                        insightTitle = "Contact at " + recordName + " hasn’t responded";
                        insightSubtitle = "We usually hear back within 4 days, but this contact hasn't responded in 8 days.";
                        trend = "down";
                        break;
                        
                    case 'Acct - No Communication':
                        insightTitle = recordName + " has a lead score of 92";
                        insightSubtitle = " • Lead source is an internal referral ";
                        insightSubtitle2 = " • Lead is an existing customer";                        
                        trend = "up";
                        break;
                    case 'Oppty - Winning Unlikely':
                        insightTitle = "Opportunity is unlikely to close in time";
                        insightSubtitle ="Recent activity suggests this deal won't be won by " + recordName;
                        
                        articles.push({type: "email", 
                                       subject: "Email - 2 days ago", 
                                       content: "Latest Activity - 9 days ago"});
                        trend = "down";                             
                        break;
                        
                    case 'Oppty - Competitor Mentioned':
                        let cont = "Jim Hansen";
                        let comp = "Sprint Networks";
                        insightTitle = "Competitor was mentioned";
                        insightSubtitle = cont + " mentioned " + comp + ".";
                        
                        articles.push({type: "email", 
                                       subject: "Related email - 4 days ago", 
                                       content: "RE:Solutions - we are currently evaluating other options from " + comp + "..."});
                        trend = "neutral"
                        break;
                        
                    case 'Oppty - Prospect Unresponsive':
                        insightTitle = "Prospect unresponsive";
                        insightSubtitle ="We usually hear from a prospect within 5 days, but we haven't heard back in 15 days.";
                        
                        articles.push({type: "call", 
                                       subject: "Called - 4 days ago", 
                                       content: "No response"});
                        trend = "down";
                        //set text color
                        break;
                        
                    case 'Oppty - Deal Slowing':
                        insightTitle = "Deal Slowing";
                        insightSubtitle = "Decrease in meetings suggests that this deal is less likely to be won.";
                        trend = "down";
                        break;
                        
                        
                    case 'Oppty - Deal Boosting':
                        insightTitle = "Deal Boosting";
                        insightSubtitle = "Current usage suggests upgrade opportunity is likely to be won";
                        
                        articles.push({type: "email", 
                                       subject: "Email - 2 days ago", 
                                       content: "Jim wanted to talk about our options..."});
                        trend = "up";
                        break;
                        
                    case 'Oppty - Time-Consuming Oppty':
                        insightTitle = "Time-consuming Opportunity";
                        insightSubtitle ="Too much time might be spent on this deal relative to its value (compared to your previous deals at this stage).";
                        
                        articles.push({type: "email", 
                                       subject: "Email - 2 days ago", 
                                       content: "Latest Activity - 9 days ago"});
                        trend = "neutral";
                        break;
                        
                    case 'Oppty - No Communication':
                        insightTitle = "No communication";
                        insightSubtitle ="There’s usually communication with this opportunity every 3 days. So far, there hasn’t been any in 9 days.";
                        
                        articles.push({type: "email", 
                                       subject: "Email - 2 days ago", 
                                       content: "Latest Activity - 9 days ago"});
                        trend = "up";
                        break;
                        
                    case 'Oppty - Re-engaged':
                        insightTitle = "Re-engaged Opportunity";
                        insightSubtitle ="There's new activity on this inactive opportunity.";
                        
                        articles.push({type: "email", 
                                       subject: "Email - 2 days ago", 
                                       content: "Latest Activity - 9 days ago"});
                        trend = "up";
                        break;
                        
                    case 'Oppty - Task Overdue':
                        insightTitle = "Opportunity has overdue task";
                        insightSubtitle = "Task was due 3 days ago.";
                        
                        articles.push({type: "email", 
                                       subject: "Email - 2 days ago", 
                                       content: "Latest Activity - 9 days ago"});
                        trend = "neutral"
                        break;
                }
                articles.push();
                insights.push({
                    title: insightTitle, 
                    record: record, 
                    recordName: record, 
                    objectType: objectType, 
                    subtitle: insightSubtitle, 
                    trend: trend, 
                    articles:articles,
                    subtitle2:insightSubtitle2
                })
            }
        }
        
        
        insights.map(function(insight){
            $A.createComponent(
                "c:Einstein_HomeInsight",
                {
                    "insight": insight
                },
                function(newInsight, status, err){
                    if(status === "SUCCESS"){
                        let insightsContainer = component.get('v.insightsContainer');
                        insightsContainer.push(newInsight);
                        component.set('v.insightsContainer', insightsContainer);
                    }
                }
            )
        })
        
    }
})