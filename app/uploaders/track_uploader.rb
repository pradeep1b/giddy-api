# frozen_string_literal: true

class TrackUploader < Shrine
  plugin :validation_helpers

  Attacher.validate do
    validate_mime_type_inclusion %w[application/octet-stream
                                    application/gpx+xml
                                    text/xml
                                    application/xml]
    validate_max_size 25 * 1024 * 1024, message: 'is too large (max is 25 MB)'
  end
end
