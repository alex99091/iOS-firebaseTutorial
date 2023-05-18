//
//  ViewController.swift
//  firebaseTutorial
//
//  Created by BOONG KI KWAK on 2023/05/17.
//

import UIKit
import FirebaseDatabase

struct TodoEntity {
    var todo: String
    var isDone: Bool = false
}


class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var todoInputTextField: UITextField!
    
    // MARK: - Property
    var ref: DatabaseReference?
    var todoList: [TodoEntity] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뷰를 띄울 때, firebase data reference 가져오기
        ref = Database.database().reference()
        
        // 테이블 뷰 데이터소스 등록
        self.todoTableView.dataSource = self
        
    }
    
    // MARK: - IB Actions
    @IBAction func addTodoButtonTabbed(_ sender: Any) {
        
        guard let userInput: String = todoInputTextField.text,
        userInput.count > 0 else {
            presentAlert()
            return
        }
        let newTodo = TodoEntity(todo: userInput, isDone: false)
        self.todoList.append(newTodo)
        // self.todoTableView.reloadData()
        
        let newIndexPath = IndexPath(row: self.todoList.count - 1, section: 0)
        self.todoTableView.insertRows(at: [newIndexPath], with: .fade)
        
        todoInputTextField.text = ""
    }
    
    // 할일이 입력되지 않았을때 알림 띄우기
    fileprivate func presentAlert() {
        let alert = UIAlertController(title: "에러 메세지",
                                      message: "입력칸이 비어있습니다. 할일을 입력해주세요.",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("확인", comment: "에러내용을 확인했습니다."), style: .default, handler: { _ in
        })
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? TodoCell else {
            return UITableViewCell()
        }
        
        let cellData: TodoEntity = todoList[indexPath.row]
        
        cell.todoLabel.text = cellData.todo
        cell.isDoneSwitch.isOn = cellData.isDone
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
}
