module VotesHelper
    def allowed_to_vote?(article)
        return false if  session[:user_id].nil?
        return true if session[:user_id].to_i != article.author.id
      end
    
      def voted?(article)
        return true if article.votes.find_by(user_id: session[:user_id]).present?
      end
    
      def find_vote_id(article)
        article.votes.find_by(user_id: session[:user_id]).id
      end
end
