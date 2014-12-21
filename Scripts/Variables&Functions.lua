local function fadeall(top, right, bottom, left, self)
	self:fadetop(top)
	self:faderight(right)
	self:fadebottom(bottom)
	self:fadeleft(left)
end

function ActorCondition(cond, actor)
	if cond then return actor else return Def.Actor{}; end
end
