##########
# SLS FOR PILLAR AND GRAIN COMMON VARIABLES
##########

# Use Server ID from grains, if not found in servers.sls, use default
{% set id = salt["grains.get"]("id", "") %}
# Mycel clients
{% set mycelclients = "clients:"+id+":mycelclients" %}
# Search clients
{% set searchclients = "clients:"+id+":searchclients" %}
# Image server settings
{% set server = "servers:"+id %}
