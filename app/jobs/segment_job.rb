class SegmentJob

  def run(segment_hash)
    post_to_segment(segment_hash)
    analytics = Segment::Analytics.new({
      write_key: ENV["SEGMENT_WRITE_KEY"],
      on_error: Proc.new { |status, msg| print msg }
    })

    # sample example
    analytics.identify(
      user_id: segment_hash["userId"],
      context: { ip: segment_hash["context"]["ip"] }
    )
  end

end
