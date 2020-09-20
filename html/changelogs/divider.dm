################################
# Example Changelog File
#
# Note: This file, and files beginning with ".", and files that don't end in ".yml" will not be read. If you change this file, you will look really dumb.
#
# Your changelog will be merged with a master changelog. (New stuff added only, and only on the date entry for the day it was merged.)
# When it is, any changes listed below will disappear.
#
# Valid Prefixes: 
#   bugfix
#   wip (For works in progress)
#   tweak
#   soundadd
#   sounddel
#   rscadd (general adding of nice things)
#   rscdel (general deleting of nice things)
#   imageadd
#   imagedel
#   maptweak
#   spellcheck (typo fixes)
#   experiment
#################################

# Your name.  
author: Nanako

# Optional: Remove this file after generating master changelog.  Useful for PR changelogs that won't get used again.
delete-after: True

# Any changes you've made.  See valid prefix list above.
# INDENT WITH TWO SPACES.  NOT TABS.  SPACES.
# SCREW THIS UP AND IT WON'T WORK.
# Also, all entries are changed into a single [] after a master changelog generation. Just remove the brackets when you add new entries.
# Please surround your changes in  double quotes ("), as certain characters otherwise screws up compiling. The quotes will not show up in the changelog.
changes: 
  - rscadd: "Added the divider, a durable new carrier necromorph who excels at overwhelming a single victim."
  - rscadd: "Humans now stomp when attacking small mobs on the floor."
  - soundadd: "Added new audio for limb breaking."
  - tweak: "When in harm intent, firing guns at a turf now autotargets mobs in the same turf, this makes it much easier to aim at small things like divider components."
