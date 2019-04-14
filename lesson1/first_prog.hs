toPart recipient = "Dear " ++ recipient ++ ",\n"
bodyPart bookTitle = "Thank you for buying " ++ bookTitle ++ ".\n"
fromPart author = "Thanks,\n" ++ author
createEmail recipient bookTitle author = toPart recipient ++
                                         bodyPart bookTitle ++
                                         fromPart author
main :: IO()
main = do
    print "Who is the mail for?"
    recipient <- getLine
    print "What is the Title?"
    title <- getLine
    print "Who is the Author?"
    author <- getLine
    print (createEmail recipient title author)
