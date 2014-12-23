function fadeall(top, right, bottom, left, self)
	self:fadetop(top)
	self:faderight(right)
	self:fadebottom(bottom)
	self:fadeleft(left)
end

function ActorCondition(cond, actor)
	if cond then return actor else return Def.Actor{}; end
end

--because Kyzentun wants me to support his jank aspect ratio
curAspect = round(GetScreenAspectRatio(),5)
