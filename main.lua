display.setDefault( "anchorX", 0 )
display.setDefault( "anchorY", 0 )

math.randomseed(os.time())
local _W = display.contentWidth
local _H = display.contentHeight

local turnScreen
local Images
local move
local createImage
local falling
local pic
local font 
local square
local selectNumber
local questionNumber
local bloodType
local firtquestion
local remove

local questionTextA = {"1. 길에서 나눠주는 선전용지나 티슈를 받는다.","2. 단순한 이성친구라고 해도 두 사람만 있으면 두근거린다.","3. 보통 가방은 큰 것을 애용한다."
,"4. 좋아하는 드라마를 못보게 되면 다시보기를 통해 꼭 본다.","5. 잡지는 맨 처음 페이지부터 순서대로 읽는다.","6. 외출할 때 무엇을 입을까 고민하는 등 준비하는데 시간이 걸리는 편이다."
,"7. 사랑을 하면 좋아하는 사람이 생겼다고 친구에게 털어놓는다.","8. 계획은 수첩에 착실하게 적어둔다.","9. 요령있게 다른 사람과 잘 사귀는 사람을 부럽다고 생각한다."
,"10. 단골 미용실이 있고 헤어디자이너도 정해져있다.","11. 잘생긴 남자 혹은 예쁜 여자는 성격이 나쁜 경우가 많다고 생각한다."
, "12. 화제가 도중에 끊어지면 새로운 화제를 끌어 들이는 타입이다.","13. 삐뚤게 찢어진 종이나 테이프에 신경이 거슬린다.","14. 내가 사귀는 사람에게 친구가 트집을 잡아도 신경쓰지 않는다."
,"15. 설명해도 이해하지 못할 것 같은 상대는 납득 시키려고 하지 않는다."}


local questionTextB = {"1. 다음에 태어날 때는 인간이 아닌 다른 동물이었으면 좋겠다.","2. 다른 사람과 이야기할 때 속으로는 딴 생각할 때가 많다."
,"3. 친구가 노래방에 가자고 조르면 거의 같이 가는 편이다.","4. 좋아하는 가수의 새로운 음악은 발매일 아침 제일 먼저 구입하거나 구하는 편이다."
,"5. 미남, 미녀보다 개성적이고 재미있는 이성이 좋다.","6. 부모님으로부터 복장과 머리모양에 대해 잔소리를 꽤 듣는다.","7. 친구의 이성친구를 보고 어떤 면이 좋다는거지? 라고 생각할 때가 많다."
,"8. 지하철이나 버스에 가까스로 뛰어들어 승차할 때가 많다.","9. 실연에서 벗어나는 것이 비교적 빠른 편이다.","10. 동년배뿐 아니라 연상, 연하의 이성도 친구인 경우가 많다.","11.예능에는 좀 서툰 편이다."
,"12. 사람의 기분은 날씨에 많이 좌우된다고 생각한다.","13. 쓸데없이 말이 많은 이성과 이야기하면 짜증난다.","14. 다른 사람에게 별명을 붙이는 것을 좋아하며 잘 하는 편이다.","15. 체육대회나 입학식 등 학교행사는 어렸을때부터 비교적 좋아했다."}


local questionTextO = {"1. 초등학교때 선생님에게서 귀여움을 받는 편이었다.", "2. 몇 살쯤엔 어떤 생활을 하고 싶다는 등의 장래 설계가 있다.","3. 자신의 일에 대해 이야기하고 싶어하지 않는 사람은 친구가 될 수 없다고 생각한다"
,"4. 동성친구는 자신과 닮은 성격의 사람보다 다른 타입의 사람이 많다.","5. 이성의 버릇 중에 다른 사람의 소문을 좋아하며 즐기는 이성은 싫다.","6. 매우 가지고싶은 정장은 계획을 오버해서라도 산다."
,"7. 언제까지나 부모님에게 신세를 지는 이성과는 사귀고 싶지 않다.","8. 외출할 때는 항상 외모에 신경을 쓴다.","9. 자신의 방이 조금 어지럽혀져있어도 신경쓰지 않는다."
,"10. 가게에서도 친구 집에서도 차려진 음식은 남기지 않고 먹는 편이다.","11. 이성친구가 바람을 피우는 것을 알았다면 곧 헤어진다.","12. 별로 좋지 않은 첫인상과는 반대로 좋아진 이성이 있다."
,"13. 다른 사람과의 약속이 없는 휴일은 여가를 보낸다.","14. 사귀고 있는 이성의 스케줄은 매일 확실히 파악하고 싶다.","15. 그룹에서 행동할 때는 마무리 정리의 역할을 할 때가 많다."}


local questionTextAB = {"1. 작년에 산 정장 중에 옷장에 처박혀 있는 것이 있다.","2. 생일날 어느 누구에게 선물을 받지 못한다면 쓸쓸할 것이다.","3. 스포츠는 그다지 즐기지 않지만 관람은 매우 좋아한다."
,"4. 휴일에는 집에서 보내는 것보다 밖으로 외출할 때가 많은 편이다.","5. 항상 하고 다니는 부적같은 액세서리가 있다.","6. 모두 함께 사진을 찍을 때 한가운데가 아닌 가장자리에 서는 편이다."
,"7. 어릴때는 여러 명의 이성친구와 사귀는 편이 좋다고 생각했다.","8. 이성친구와 헤어질 때는 매우 슬플 것이다.","9. 다른 사람과의 모임으로 자신의 계획이 변경 되는 것을 매우 싫어한다."
,"10. 술 마시러 가서는 2차,3차든 끝까지 남는 타입이다.","11. 겉치레적인 말을 하는 일이 자주 있다고 생각한다.", "12. 처음 봤을 때와 인상이 다르다는 말을 자주 듣는다."
,"13. 많은 사람 앞에서 이야기 하거나 사회를 보는 것은 잘 못한다.", "14. 자신의 성격은 자신이 제일 잘 안다고 생각한다.","15. 여행할 때, 티켓과 숙소 예약은 빨리하는 편이다."}


local charData = 
	 {
	   	width = 66,
	   	height = 68,
	   	numFrames = 4,
		sheetContentWidth = 265,
 	    sheetContentHeight = 68,
	 }

local sheetData = 
	{
	 {name = "walk",frames = {1, 2, 3, 4}, time = 1000, loapCount = 0},
	}

local sheet = graphics.newImageSheet( "w.png", charData )

local charAnimation

-- start!
function Images( )
	local img = display.newImage("background.png", 0, 0)
	local img = display.newImage("smalltree1.png",20,20)
	local img = display.newImage("realchangedtree2.png",230,40)
	local img = display.newImage("changedABhyung.png",100,150)
	local img = display.newImage("changedstartbutton.png",82,330)
	local img = display.newImage("changedAhyung.png",240,425)
	local img = display.newImage("changedOhyung.png",-23.5,250)
	local img = display.newImage("changedBhyung.png",262,280)
	local img = display.newImage("mainname.png",10,220)

	local function dissolve ( e )
			s= e.source
			transition.to(d,{time = 420, alpha = 0.2})
			transition.to(d,{time = 420, delay = 421 , alpha = 1.0})
	end

	d = display.newText("이 게임은 과학적 근거가 전혀 없으므로 재미로 즐겨주시기 바랍니다.",13, 412, native.newFont("맑은 고딕"))
	d.size = 9.5
	d:setTextColor(255,0,255,255)

	timer.performWithDelay( 855, dissolve, 0 )

	Runtime:addEventListener("touch", turnScreen )
end

--charMove
function move ( e )
   if e.x <= _W/2 then
   		if charAnimation.x <=2 then
   				charAnimation.x = 0
   		else
   				charAnimation.x=charAnimation.x-2
   		end 
	else

		if charAnimation.x >_W-charAnimation.contentWidth then
	   				charAnimation.x = _W-charAnimation.contentWidth
		else
	   				charAnimation.x=charAnimation.x+2
		end 
	end
end

function turnScreen ( e )
 Runtime:removeEventListener("touch", turnScreen )
   --timer.cancel(s)
   bg = display.newImage("background.png",0,0)
   bg.anchorX, bg.anchorY = 0,0

    charAnimation = display.newSprite( sheet, sheetData )
	charAnimation.x = _W/2
	charAnimation.y = _H / 3*2.8

	Runtime:addEventListener("touch", move)
	charAnimation:play()
	createImage()
end

function createImage()

	local x1 = math.random(0, _W*0.8)
	local num = math.random(1,7)

	if num == 1 then
		pic = display.newImage("ladybug1.png",x1,0)
		print("ping1")
	elseif num == 2 then
		pic = display.newImage("ladybug2.png",x1,0)
		print("ping2")
	elseif num == 3 then
		pic = display.newImage("grass1.png",x1,0)
		print("ping3")
	elseif num == 4 then
		pic = display.newImage("grass2.png",x1,0)		
		print("ping4")
	elseif num == 5 then
		pic = display.newImage("home.png",x1,0)
		print("ping5")
	elseif num == 6 then
		pic = display.newImage("smalltree1.png",x1,0)
		print("ping6")
	else
		pic = display.newImage("realchangedtree2.png",x1,0)
		print("ping7")
	end
	Runtime:addEventListener("enterFrame", falling)

end

function falling()
	
	print(pic.y)
	if ( pic.y + pic.contentHeight * 0.8 ) <= ( charAnimation.y - charAnimation.contentHeight * 0.5 ) then
		pic.y = pic.y + 3
	else
		Runtime:removeEventListener("enterFrame", falling)
		--- 질문!
		--first
	end

	local imgsq = display.newImage("square.png",13,220)
			font = display.newText("당신의 혈액형은 무엇입니까?",30, 230, native.newFont("맑은 고딕"))
			font.size = 20
			font:setTextColor(0,0,0)

			local imga = display.newImage("Aim.png",20,350)
			local imgb = display.newImage("Bim.png",90,350)
			local imgo = display.newImage("Oim.png",160,350)
			local imgab = display.newImage("ABim.png",230,350)

			

		local function bloodType_A( e )

			local imgsq = display.newImage("square.png",13,220)
			print(questionTextA[1])

		end

		display.remove(imgsq)
		createImage()
		imga:addEventListener("touch",bloodType_A)
end
			

		
		--- 질문이 다 끝나면 >> 결과화면 
Images()