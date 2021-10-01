public class TaskDeletion {
    
    public static void TaskDelete(List<Task> TaskList)
    {
        Id UserId = UserInfo.getProfileId();
        profile Profilename = [SELECT name from profile where ID=:UserId];
        for(Task t:TaskList)
        {
            if(Profilename.name!='System Administrator')
            {
                t.addError('You are NOT authorised to Delete tasks. Contact System Admins');
            }
        }
    }

}