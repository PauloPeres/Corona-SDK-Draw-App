Vector2D = {}
local mSqrt = math.sqrt;
local mCos = math.cos;
local mSin = math.sin;
local mAtan = math.atan;
local mAtan2 = math.atan2;
local pi = math.pi;
function Vector2D:new(x, y)  -- The constructor
  local object = { x = x, y = y }
  setmetatable(object, { __index = Vector2D })  -- Inheritance
  return object
end

function Vector2D:copy()
	return Vector2D:new(self.x, self.y)
end

function Vector2D:copyTo(otherVector)
	otherVector.x = self.x
	otherVector.y = self.y
end

function Vector2D:magnitude()
	return mSqrt(self.x^2 + self.y^2)
end
function Vector2D:length()
    return mSqrt(self.x * self.x + self.y *self.y);
end
function Vector2D:Length(vec)
    return mSqrt(vec.x * vec.x + vec.y *vec.y);
end


function Vector2D:normalize()
	local temp
	temp = self:magnitude()
	if temp > 0 then
		self.x = self.x / temp
		self.y = self.y / temp
	end
end
function Vector2D:cos_sin()
    self.x = mCos(self.x);
    self.y = mSin(self.y)

end
function Vector2D:dotProduct(vec)
    return self.x * vec.y - self.y * vec.x;

end

function Vector2D:sign(vec)
    local t = Vector2D:perpendicular(self);
    t = t:dotProduct(vec);
    if t < 0 then
        return -1;
    else
        return 1;
    end

end

function Vector2D:perpendicular(vec)
    return Vector2D:new(-vec.y , vec.x);
end
function Vector2D:limit(l)
	if self.x > l then
		self.x = l
	end

	if self.y > l then
		self.y = l
	end
end
function Vector2D:angle()
	local ang = mAtan(self.x , self.y);
	if(self.y< 0 and self.x > 0) then
		return ang;
	end
	if(self.y < 0 and self.x < 0) or(self.y > 0 and self.x < 0) then
		return ang + pi;
	end
	return ang + (pi *2);

end


function Vector2D:equals(vec)
	if self.x == vec.x and self.y == vec.y then
		return true
	else
		return false
	end
end
function Vector2D:truncate(s)
    if #self > s then
        self:normalize();
        self =  self:mult(s);
    end

end


function Vector2D:add(vec)
	self.x = self.x + vec.x
	self.y = self.y + vec.y
end

function Vector2D:sub(vec)
	self.x = self.x - vec.x
	self.y = self.y - vec.y
end

function Vector2D:mult(s)
	self.x = self.x * s
	self.y = self.y * s
end

function Vector2D:div(s)
	self.x = self.x / s
	self.y = self.y / s
end

function Vector2D:dot(vec)
	return self.x * vec.x + self.y * vec.y
end

function Vector2D:dist(vec2)
	return mSqrt( (vec2.x - self.x) + (vec2.y - self.y) )
end

-- Class Methods

function Vector2D:Normalize(vec)	
	local tempVec = Vector2D:new(vec.x,vec.y)
	local temp
	temp = tempVec:magnitude()
	if temp > 0 then
		tempVec.x = tempVec.x / temp
		tempVec.y = tempVec.y / temp
	end
	
	return tempVec
end

function Vector2D:Limit(vec,l)
	local tempVec = Vector2D:new(vec.x,vec.y)
	
	if tempVec.x > l then
		tempVec.x = l		
	end
	
	if tempVec.y > l then
		tempVec.y = l		
	end
	
	return tempVec
end

function Vector2D:Add(vec1, vec2)
	local vec = Vector2D:new(0,0)
	vec.x = vec1.x + vec2.x
	vec.y = vec1.y + vec2.y
	return vec
end

function Vector2D:Sub(vec1, vec2)
	local vec = Vector2D:new(0,0)
	vec.x = vec1.x - vec2.x
	vec.y = vec1.y - vec2.y
	
	return vec
end

function Vector2D:Mult(vec, s)
	local tempVec = Vector2D:new(0,0)
	tempVec.x = vec.x * s
	tempVec.y = vec.y * s
	
	return tempVec
end

function Vector2D:Div(vec, s)
	local tempVec = Vector2D:new(0,0)
	tempVec.x = vec.x / s
	tempVec.y = vec.y / s
	
	return tempVec
end
function Vector2D:toRad(vec)
    return mAtan2(vec.y,vec.y);
end


function Vector2D:Dist(vec1, vec2)
	return mSqrt( (vec2.x - vec1.x) + (vec2.y - vec1.y) )
end
function Vector2D:distance(vec1)
    local dx = vec1.x - self.x;
    local dy = vec1.y - self.y;
    return mSqrt(dx*dx + dy*dy);


end
function Vector2D:Distance(vec1, vec2)
    local dx = vec2.x - vec1.x;
    local dy = vec2.y - vec1.y;
    return mSqrt(dx*dx + dy*dy);


end

return Vector2D