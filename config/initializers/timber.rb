# frozen_string_literal: true

# Timber.io Ruby Configuration - Simple Structured Logging
#
#  ^  ^  ^   ^      ___I_      ^  ^   ^  ^  ^   ^  ^
# /|\/|\/|\ /|\    /\-_--\    /|\/|\ /|\/|\/|\ /|\/|\
# /|\/|\/|\ /|\   /  \_-__\   /|\/|\ /|\/|\/|\ /|\/|\
# /|\/|\/|\ /|\   |[]| [] |   /|\/|\ /|\/|\/|\ /|\/|\
# -------------------------------------------------------------------
# Website:       https://timber.io
# Documentation: https://timber.io/docs
# Support:       support@timber.io
# -------------------------------------------------------------------

config = Timber::Config.instance

config.integrations.action_view.silence = Rails.env.production?

# Add additional configuration here.
# For common configuration options see:
# https://timber.io/docs/languages/ruby/configuration
#
# For a full list of configuration options see:
# http://www.rubydoc.info/github/timberio/timber-ruby/Timber/Config
