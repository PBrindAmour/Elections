namespace ElectionsAPI
{
    public static class Helper
    {

        public static string? getTwitterUserById(int twitterUserId)
        {
            if(twitterUserId == 472202033)
            {
                return "Dominique Anglade";
            }
            throw new Exception("Cannot find user");
        }
    }
}
