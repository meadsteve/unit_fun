%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/"],
        excluded: []
      },
      checks: [
        # Ignoring line lengths for now as I can't get credo to ignore
        # the multi line function docs. Some of which have examples which shouldn't
        # have line breaks
        {Credo.Check.Readability.MaxLineLength, false},

        # I'm not sure I like this rule
        {Credo.Check.Readability.PreferImplicitTry, false},

        # For now every case of a raise is correct - address this later potentially
        {Credo.Check.Warning.RaiseInsideRescue, false},

      ]
    }
  ]
}