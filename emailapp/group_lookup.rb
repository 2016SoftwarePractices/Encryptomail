require "../webapp/config/environment"

module GroupLookup
    
end

def group_lookup(email)
    if (Group.where(email: email).exists?) 
        Group.find_by(email: email) 
    else 
        nil
    end
    
end
