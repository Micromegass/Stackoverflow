module QuestionsHelper
  def form_title
    @question.new_record? ? "Publish Question" : "Modificar Question"
  end
end
