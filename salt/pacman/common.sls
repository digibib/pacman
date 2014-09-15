##########
# SLS FOR PILLAR AND GRAIN COMMON VARIABLES
##########

# Server ID
{% set id = salt["grains.get"]("id", "default") %}
# Mycel clients
{% set mycelclients = "clients:"+id+":mycelclients" %}
# Search clients
{% set searchclients = "clients:"+id+":searchclients" %}
# Image server settings
{% set server = "servers:"+id %}
