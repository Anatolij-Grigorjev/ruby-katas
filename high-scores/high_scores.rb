class HighScores
  @scores = []

  def initialize(scores)
    @scores = scores
  end

  def scores
    @scores
  end

  def latest
    @scores.last
  end

  def personal_best
    top_n_scores(1)
  end

  def personal_top_three
    top_n_scores(3)
  end

  def latest_is_personal_best?
    personal_best == latest
  end

  private

  def top_n_scores(n)
    if n > 1 then @scores.max(n) else @scores.max end
  end
end
