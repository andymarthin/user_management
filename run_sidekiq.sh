#!/usr/bin/env bash
psrecord 'bundle exec sidekiq -C config/sidekiq.yml'  --include-children --plot plot-sidekiq.png