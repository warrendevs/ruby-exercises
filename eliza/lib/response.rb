class Response
  @@responses = []
  @@dummy_answers = []

  def self.add_response question, *answers
    @@responses << new(question, answers)
  end

  def self.get_answer question
    responses = @@responses.select{|r| r.good_for? question}
    if responses.length > 0
      responses.sample.get_answers.sample
    else
      @@dummy_answers.sample
    end
  end

  def initialize question, answers
    @question = question.downcase
    @answers = answers
  end

  def good_for? question
    question.downcase.include? @question
  end

  def get_answers
    @answers
  end

  def self.add_dummies *answers
    @@dummy_answers = answers
  end
end
