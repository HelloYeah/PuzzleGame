# PuzzleGame

###swift拼图
####源码链接：https://github.com/HelloYeah/PuzzleGame

最近在自学swift，工作一直用OC，一接触swift，语法上还是有很大的差异。用起来相当不适应。在百度大神的助力下艰辛的把这个拼图demo写出来。可能由于天资愚笨😭。。。

欢迎各路大神斧正。欢迎各位新学swift的一起交流。

效果图如下

![2.gif](http://upload-images.jianshu.io/upload_images/1338042-c23ac363b8de0fe2.gif?imageMogr2/auto-orient/strip)


####思路解析

每张可移动的纸片设计为Puzzle类。 Puzzle 有行号，列号，图片三个属性 和 移动方法 func move(direction : Direction)


    import UIKit

    enum Direction {
        case DirectionUp
        case DirectionDown
        case DirectionLeft
        case DirectionRight
    }

    class Puzzle: NSObject {
        
        var  col : NSInteger!
        var  row : NSInteger!
        private(set) var  image : UIImage!
        
        init(image: UIImage, withCol col: NSInteger, withRow row: NSInteger){
            super.init()
            self.col = col
            self.row = row
            self.image = image
        }
        
        func move(direction : Direction) {
            
            switch direction {
            case .DirectionUp:
                row = row - 1
            case .DirectionDown:
                row = row + 1
            case .DirectionLeft:
                col = col - 1
            case .DirectionRight:
                col = col + 1
            }
        }
    }


PuzzleView 用于展示Puzzle的视图。每个PuzzleView 拥有一个puzzle属性。

        import UIKit

        class PuzzleView: UIImageView {

            var puzzle : Puzzle?{
            
                didSet{
                    self.image = puzzle?.image
                }
            }
            
            override init(frame: CGRect) {
                super.init(frame: frame)
                self.layer.borderWidth = 1.0/UIScreen.main.scale
                self.layer.borderColor = UIColor.lightGray.cgColor
                self.isUserInteractionEnabled = true
            }
            
            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
        }


控制器中添加并布局好9个PuzzleView，每个PuzzleView添加点击手势。
emptyPuzzle空白的PuzzleView。每次移动时，通过这个PuzzleView 和点击的PuzzleView对比位置，相邻则可以移动。否则不做任何处理

    //emptyPuzzle空白的PuzzleView。每次移动时，通过这个PuzzleView 和点击的PuzzleView对比位置，相邻则可以移动。否则不做任何处理
    let emptyPuzzle : Puzzle = Puzzle.init(image: UIImage.init(), withCol: 2, withRow: 2)

    func click(tap: UITapGestureRecognizer) {
        let puzzleView = tap.view as! PuzzleView
        let puzzle = puzzleView.puzzle!
        
        let col = puzzle.col
        let row = puzzle.row
        
        if col == emptyPuzzle.col  {
            if row! - emptyPuzzle.row == 1 {
                puzzle.move(direction: .DirectionUp)
                puzzleView.frame.origin.y -= height
                emptyPuzzle.move(direction: .DirectionDown)
            }
            if row! - emptyPuzzle.row == -1 {
                puzzle.move(direction: .DirectionDown)
                puzzleView.frame.origin.y += height
                emptyPuzzle.move(direction: .DirectionUp)
            }
        }
        
        if row == emptyPuzzle.row  {
            if col! - emptyPuzzle.col == 1 {
                puzzle.move(direction: .DirectionLeft)
                puzzleView.frame.origin.x -= width
                emptyPuzzle.move(direction: .DirectionRight)
            }
            if col! - emptyPuzzle.col == -1 {
                puzzle.move(direction: .DirectionRight)
                puzzleView.frame.origin.x += width
                emptyPuzzle.move(direction: .DirectionLeft)
            }
        }
    }


总结：代码比较丑，原谅我这位新人。建模思路大家有更好的，可以分享一下。
