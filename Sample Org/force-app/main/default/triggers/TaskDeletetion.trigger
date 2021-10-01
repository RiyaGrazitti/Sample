trigger TaskDeletetion on Task (before delete) {

    if(Trigger.IsDelete && Trigger.IsBefore)
    {
        TaskDeletion.TaskDelete(Trigger.old);
    }
}