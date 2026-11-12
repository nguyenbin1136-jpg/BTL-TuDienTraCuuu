using System;
public class WordItem
{
    public string WordKey { get; set; }
    public string Meaning { get; set; }

    public WordItem(string key, string meaning)
    {
        WordKey = key;
        Meaning = meaning;
    }
}