def adaptX(x):
    return x

def adaptY(y):
    return -y

def adaptAngle(angle):
    return HALF_PI - angle

class Segment:
    
    def __init__(self, x, y, length, angle):
        self.a = PVector(x, y)
        self.length = length
        self.angle = angle
        
    def draw(self):
        pushMatrix()
            
        strokeWeight(5)
        stroke(0)
        fill(0)
        
        translate(adaptX(self.a.x), adaptY(self.a.y))
        rotate(adaptAngle(self.angle))
        
        circle(0, 0, 10)
        line(0, 0, 0, adaptY(self.length))
        circle(0, adaptY(self.length), 10)
        
        popMatrix()
        
    def calculateB(self):
        xb = self.a.x + cos(self.angle) * self.length
        yb = self.a.y + sin(self.angle) * self.length
        return PVector(xb, yb)
    
    def setAngleAndB(self, angle, b):
        self.angle = angle
        self.a.x = b.x - cos(self.angle) * self.length
        self.a.y = b.y - sin(self.angle) * self.length
        
class Arm:
    def __init__(self):
        self.first = Segment(0, 0, 100, 0)
        self.second = Segment(100, 0, 100, 0)
        self.third = Segment(200, 0, 100, 0)

    def draw(self):
        self.first.draw()
        self.second.draw()
        self.third.draw()
        
    def moveTo(self, tx, ty, angle):
        self.third.setAngleAndB(angle, PVector(tx, ty))
        itx = self.third.a.x
        ity = self.third.a.y
        
        a = self.first.length
        b = self.second.length
        c = sqrt(itx ** 2 + ity ** 2)
        
        alpha = acos((c ** 2 - a ** 2 - b ** 2) / (-2 * a * b))
        beta = acos((b ** 2 - a ** 2 - c ** 2) / (-2 * a * c))
        offset = atan2(ity, itx)
                
        self.first.angle = beta + offset
        self.second.a = self.first.calculateB()
        self.second.angle = - PI + self.first.angle + alpha

arm = None
rotation = HALF_PI

def setup():
    global arm
    size(640, 460)
    arm = Arm()

def draw():
    background(255)
    translate(width / 2, height / 2)
    arm.moveTo(adaptX(mouseX - width / 2), adaptY(mouseY - height / 2), rotation)
    arm.draw()
    saveFrame("images/#####.tif")
    
def mouseWheel(v):
    global rotation
    scale = 0.05
    rotation -= v.count * scale
    
