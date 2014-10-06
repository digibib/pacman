##########
# SLS FOR PILLAR AND GRAIN COMMON VARIABLES
##########

# Use Server ID from grains, if not found, use default
{% set id = salt["grains.get"]("id", "default") %}
