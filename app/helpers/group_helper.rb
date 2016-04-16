module GroupHelper
def helper_class(attri)
    if(params[:sort].to_s==attri)
      return 'hilite'
    else
      return nil
    end
  end
end
