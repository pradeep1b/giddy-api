# frozen_string_literal: true

class AttacherPromoteWorker
  include Sidekiq::Worker

  def perform(uploaded_file)
    Shrine::Attacher.promote(uploaded_file)
  end
end
