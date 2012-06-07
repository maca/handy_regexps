module HandyRegexps
  DomainName = %r{
    \b
    # Match the leading part (proto://hostname, or just hostname)
    (
      # http://, or https:// leading part
      (https?)://[-\w]+(\.\w[-\w]*)+
    |
      # or, try to find a hostname with more specific sub-expression
      (?i: [a-z0-9] (?:[-a-z0-9]*[a-z0-9])? \. )+ # sub domains
      # Now ending .com, etc. For these, require lowercase
      (?-i: com\b
          | edu\b
          | name\b
          | biz\b
          | gov\b
          | in(?:t|fo)\b # .int or .info
          | mil\b
          | net\b
          | org\b
          | [a-z][a-z]\b
          | [a-z][a-z]\.[a-z][a-z]\b # two-letter country code
      )
    )
  }ix

  Url = %r{
    #{DomainName}
    # Allow an optional port number
    ( : \d+ )?

    # The rest of the URL is optional, and begins with /
    (
      /
      # The rest are heuristics for what seems to work well
      [^.!,?;"'<>()\[\]\{\}\s\x7F-\xFF]*
      (
        [.!,?]+ [^.!,?;"'<>()\[\]\{\}\s\x7F-\xFF]+
      )*
    )?
    # http://immike.net/blog/2007/04/06/5-regular-expressions-every-web-programmer-should-know/
  }ix

  Email = %r{
    [a-z0-9!\#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!\#$%&'*+/=?^_`{|}~-]+)*
    @
    #{DomainName}
  }ix
end
