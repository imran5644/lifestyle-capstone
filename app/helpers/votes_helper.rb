module VotesHelper
  def allowed_to_vote?(article)
    if logged_in?
      if current_user != article.author.id
        'd-flex'
      else
        'd-none'
      end
    else
      'd-none'
    end
  end

  def voted?(article)
    return false if current_user.nil?
    return true if article.votes.find_by(user_id: current_user).present?
  end

  def confirmation(article)
    return { confirm: 'Are you sure?' } if voted?(article)
  end

  def class_voted(article)
    return 'disable' if voted?(article)
  end

  def message_vote(article)
    !voted?(article) ? 'Add vote' : 'Delete vote'
  end

  def find_vote_id(article)
    article.votes.find_by(user_id: current_user).id
  end

  def action_vote(article)
    if voted?(article)
      edit_vote_path(id: find_vote_id(article))
    else
      new_vote_path(article_id: article.id)
    end
  end
end
