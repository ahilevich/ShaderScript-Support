# Creates the repository's labels with the GitHub CLI (https://cli.github.com), or updates them if they exist. Run it
# once, after `gh auth login`, from this folder:   pwsh ./setup-labels.ps1
# GitHub's default labels it doesn't list (good first issue, help wanted, invalid) can be deleted on the Labels page.
$repo = 'ahilevich/ShaderScript-Support'

$labels = @(
    # What it is
    @{ name = 'bug';                  color = 'd73a4a'; description = "Something doesn't work as it should" }
    @{ name = 'enhancement';          color = 'a2eeef'; description = 'A new feature or an improvement' }
    @{ name = 'question';             color = 'd876e3'; description = 'How to do something' }
    @{ name = 'documentation';        color = '0075ca'; description = 'The manual or the API reference' }
    @{ name = 'duplicate';            color = 'cfd3d7'; description = 'Already reported' }
    # Where it stands
    @{ name = 'needs repro';          color = 'fbca04'; description = 'Needs steps or a shader that reproduce it' }
    @{ name = 'confirmed';            color = 'b60205'; description = 'Reproduced, will be fixed' }
    @{ name = 'fixed in next version'; color = '0e8a16'; description = 'Fixed; the fix comes with the next version' }
    @{ name = "won't fix";            color = 'ffffff'; description = "Works as intended, or won't be changed" }
    # Which render pipeline
    @{ name = 'URP';                  color = '5319e7'; description = 'Universal Render Pipeline' }
    @{ name = 'HDRP';                 color = '1d76db'; description = 'High Definition Render Pipeline' }
)

foreach ($label in $labels) {
    gh label create $label.name --repo $repo --color $label.color --description $label.description --force
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
