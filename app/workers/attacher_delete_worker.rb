# frozen_string_literal: true

class AttacherDeleteWorker
  include Sidekiq::Worker

  def perform(uploaded_file)
    Shrine::Attacher.delete(uploaded_file)
  end
end
