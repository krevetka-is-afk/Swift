import UIKit

class ViewController: UIViewController {
    private var treeView = UIView()
    private var circles = [UIView]()
    private var toggleButton = UIButton()
    private var isGarlandOn = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTree()
        setupGarland()
        setupToggleButton()
    }

    private func setupTree() {
        // Верхний треугольник
        let topTriangle = createTriangle(size: CGSize(width: 200, height: 200))
        view.addSubview(topTriangle)
        topTriangle.pinCenterX(to: view.centerXAnchor)
        topTriangle.pinTop(to: view.topAnchor, 100)

        // Нижний треугольник
        let bottomTriangle = createTriangle(size: CGSize(width: 300, height: 300))
        view.addSubview(bottomTriangle)
        bottomTriangle.pinCenterX(to: view.centerXAnchor)
        bottomTriangle.pinTop(to: topTriangle.bottomAnchor, -50)

        // Ствол дерева
        let trunk = UIView()
        trunk.backgroundColor = .brown
        view.addSubview(trunk)
        trunk.pinCenterX(to: view.centerXAnchor)
        trunk.pinTop(to: bottomTriangle.bottomAnchor, -20)
        trunk.setWidth(mode: .equal, 50)
        trunk.setHeight(mode: .equal, 100)

        // Сохраняем дерево
        treeView = UIView()
        view.addSubview(treeView)
        treeView.pinCenterX(to: view.centerXAnchor)
        treeView.pinTop(to: view.topAnchor, 100)
    }

    private func setupGarland() {
        // Создаем гирлянду (кружки)
        let positions: [(CGFloat, CGFloat)] = [(0, 150), (-70, 100), (70, 100), (-100, 180), (100, 180)]
        for pos in positions {
            let circle = createCircle()
            treeView.addSubview(circle)
            circle.pinCenterX(to: treeView.centerXAnchor, pos.0)
            circle.pinTop(to: treeView.topAnchor, pos.1)
            circles.append(circle)
        }
    }

    private func setupToggleButton() {
        // Создаем кнопку для включения/выключения гирлянды
        toggleButton.setTitle("Off", for: .normal)
        toggleButton.setTitleColor(.white, for: .normal)
        toggleButton.backgroundColor = .darkGray
        toggleButton.layer.cornerRadius = 10
        toggleButton.addTarget(self, action: #selector(toggleGarland), for: .touchUpInside)

        view.addSubview(toggleButton)
        toggleButton.pinCenterX(to: view.centerXAnchor)
        toggleButton.pinTop(to: treeView.bottomAnchor, 40)
        toggleButton.setWidth(mode: .equal, 100)
        toggleButton.setHeight(mode: .equal, 50)
    }

    @objc private func toggleGarland() {
        isGarlandOn.toggle()
        toggleButton.setTitle(isGarlandOn ? "On" : "Off", for: .normal)

        for circle in circles {
            UIView.animate(withDuration: 0.5, animations: {
                circle.backgroundColor = self.isGarlandOn ? self.randomColor() : .clear
            })
        }
    }

    private func createTriangle(size: CGSize) -> UIView {
        let triangleView = UIView()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: size.height))
        path.addLine(to: CGPoint(x: size.width / 2, y: 0))
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.green.cgColor

        triangleView.layer.addSublayer(shapeLayer)
        triangleView.setWidth(mode: .equal, size.width)
        triangleView.setHeight(mode: .equal, size.height)
        return triangleView
    }

    private func createCircle() -> UIView {
        let circle = UIView()
        circle.backgroundColor = .clear
        circle.layer.cornerRadius = 15
        circle.setWidth(mode: .equal, 30)
        circle.setHeight(mode: .equal, 30)
        return circle
    }

    private func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
