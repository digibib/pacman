##########
# SLS FOR PILLAR AND GRAIN COMMON VARIABLES
##########

# Server ID
{% set id = salt["grains.get"]("id", "default") %}
# Mycel clients
{% set mycelclients = "clients:mycelclients:"+id %}
# Search clients
{% set searchclients = "clients:searchclients:"+id %}
# Image server settings
{% set server = "servers:"+id %}