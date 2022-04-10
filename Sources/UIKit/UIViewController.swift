
import Foundation
import CoreGraphics

/**
 * Created by godshadow on 11/3/16.
 */

public class UIViewController : NSObject
{
    var _view:UIView? = nil
    var view: UIView { get { _view! } }
        
    var layer_id: String? = nil
    var layer:Any? = nil
    
    var resource_path:String? = nil

    var _on_view_loaded_target:Any? = nil
    var _on_view_loaded_action:Any? = nil

    var _on_load_layer_target:Any? = nil
    var _on_load_layer_action:Any? = nil

    var _view_is_loaded = false
    var _layer_is_ready = false

    var _child_view_controllers: [UIViewController] = []
    public var parentViewController: UIViewController? = nil

    public var presentingViewController: UIViewController? = nil
    public var presentedViewController: UIView? = nil
    public var navigationController: UINavigationController? = nil
    public var navigationItem: UINavigationItem? = nil
    public var splitViewController: UISplitViewController? = nil
    public var tabBarController:UITabBarController? = nil

    var _modal_presentation_style:UIModalPresentationStyle? = nil
    var modalPresentationStyle:UIModalPresentationStyle {
        get {
            if _modal_presentation_style != nil { return _modal_presentation_style! }
//            MIOCoreIsPhone() == true ? UIModalPresentationStyle.fullScreen : UIModalPresentationStyle.pageSheet;
//        modalTransitionStyle = UIModalTransitionStyle.CoverVertical;
            return UIModalPresentationStyle.pageSheet
        }
        set {
            _modal_presentation_style = newValue
        }
    }
    
    var transitioningDelegate:Any? = nil

    open var content_size = CGSize(width: 320, height: 200)
    open var preferred_content_size:CGSize? = nil

//    constructor(layerID?) {
//        super();
//        this.layerID = layerID ? layerID : MUICoreLayerIDFromObject(this);
//    }

    override init() {
        super.init()
        loadView()
    }

    init(withCoder coder: NSCoder) {
        super.init()
    }

//    initWithLayer(layer, owner, options?) {
//        super.init();
//
//        // this.view = MUICoreViewCreateView(layer, owner);
//        // this.view._checkSegues();
//
//        // Search for navigation item
//        //this.navigationItem = UINavItemSearchInLayer(layer);
//
//        this.loadView();
//    }
//
//    initWithResource(path) {
//        if (path == null) throw new Error("UIViewController:initWithResource can't be null");
//        super.init();
//
//        this._htmlResourcePath = path;
//        this.loadView();
//    }
//
//    localizeSubLayers(layers) {
//        if (layers.length == 0)
//            return;
//
//        for (let index = 0; index < layers.length; index++) {
//            let layer = layers[index];
//
//            if (layer.tagName != "DIV") continue;
//
//            let key = layer.getAttribute("data-localize-key");
//            if (key != null)
//                layer.innerHTML = NSLocalizeString(key, key);
//
//            this.localizeSubLayers(layer.childNodes);
//        }
//    }
//
//    localizeLayerIDWithKey(layerID, key) {
//        let layer = MUICoreLayerSearchElementByID(this.view.layer, layerID);
//        layer.innerHTML = NSLocalizeString(key, key);
//    }

    open var content_view: UIView? = nil
    func loadView() {
        if _view != nil {
//            _didLoadView()
            return
        }
/*
        if (this._htmlResourcePath == null) {
            this.view = new UIView(this.layerID);
            this.view.init();
            MUICoreLayerAddStyle(this.view.layer, "view-controller");
            //this.view.layer.style.height = "100%";
            this._didLoadView();
            return;
        }

        MUICoreBundleLoadNibName(this._htmlResourcePath, this, function (this: UIViewController, layer, classname:string) {
            this._loadViewFromNib(layer, classname);
        });
*/
        // let mainBundle = NSBundle.mainBundle();
        // mainBundle.loadNibNamed(this._htmlResourcePath, this, null);

        // mainBundle.loadHTMLNamed(this._htmlResourcePath, this.layerID, this, function (layer) {

        //     let domParser = new DOMParser();
        //     let items = domParser.parseFromString(layerData, "text/html");
        //     let layer = items.getElementById(layerID);

        //     if (target != null && completion != null)
        //         completion.call(target, layer);


        //     // Search for navigation item
        //     this.navigationItem = UINavItemSearchInLayer(layer);

        //     this.view.initWithLayer(layer);
        //     this.view.awakeFromHTML();
        //     this._didLoadView();
        // });
    }

//    open _load_view_from_nib(layer, classname:String){
//        let layerID = layer.getAttribute("id");
//        if (layerID != null) this._outlets[layerID] = this;
//
//        this._contentView = new UIView();
//        this._contentView.initWithLayer(layer, this, {"Object": this});
//        this.view = this._contentView.subviews[0];
//        this._segues = this._contentView._segues;
//        this._checkSegues();
//        this._didLoadView();
//    }
//
//    _didLoadNibWithLayer(layerData) {
//        let domParser = new DOMParser();
//        let items = domParser.parseFromString(layerData, "text/html");
//        let layer = items.getElementById("kk");
//
//        //this.navigationItem = UINavItemSearchInLayer(layer);
//
//        this.view.initWithLayer(layer, this);
//        this.view.awakeFromHTML();
//
//        this._didLoadView();
//    }

//    _didLoadView() {
//        this._layerIsReady = true;
//        if (MIOCoreIsPhone() == true) MUICoreLayerAddStyle(this.view.layer, "phone");
//
//        if (this._onLoadLayerTarget != null && this._onViewLoadedAction != null) {
//            this._onLoadLayerAction.call(this._onLoadLayerTarget);
//            this._onLoadLayerTarget = null;
//            this._onLoadLayerAction = null;
//        }
//
//        if (this._onViewLoadedAction != null && this._onViewLoadedTarget != null) {
//            this.viewDidLoad();
//            this._loadChildControllers();
//        }
//        else if (this._htmlResourcePath == null){
//            this.viewDidLoad();
//            this._loadChildControllers();
//        }
//    }

    open func _load_child_controllers() {
        let count = _child_view_controllers.count

//        if (count > 0)
//            _load_child_view_controller(0, count)
//        else
//            _set_view_loaded(true)
    }

    open func _load_child_view_controller(_ index:Int, _ max:Int) {
//        if (index < max) {
//            let vc = _child_view_controllers[index]
//            vc.onLoadView(this, function (this: UIViewController) {
//
//                let new_index = index + 1;
//                _load_child_view_controller(new_index, max)
//            });
//        }
//        else {
//            _set_view_loaded(true)
//        }
    }

    open func _setview_loaded(value:Bool) {
        willChangeValue(forKey: "viewLoaded")
        _view_is_loaded = value
        didChangeValue(forKey: "viewLoaded")

        if value == true && _on_view_loaded_action != nil {
//            _on_view_loaded_action()
        }

        _on_view_loaded_target = nil
        _on_view_loaded_action = nil
        view.setNeedsDisplay()
    }

    open func _on_load_view(_ target:Any, _ action:Any) {
        _on_view_loaded_target = target
        _on_view_loaded_action = action

        if _view_is_loaded == true {
            //action.call(target);
        }
        else if _layer_is_ready == true {
            viewDidLoad()
            _load_child_controllers()
            //this.view.setNeedsDisplay();
        }
    }

//    onLoadLayer(target, action) {
//        if (this._layerIsReady == true) {
//            action.call(target);
//        }
//        else {
//            this._onLoadLayerTarget = action;
//            this._onLoadLayerAction = target;
//        }
//    }

    public var viewLoaded:Bool { get {
        return _view_is_loaded
    } }

    public var childViewControllers:[UIViewController] { get {
        return _child_view_controllers
    } }

    func addChild(_ childController: UIViewController) {
        childController.parentViewController = self
        _child_view_controllers.append(childController)
        //vc.willMoveToParentViewController(this);
    }

    func removeFromParent() {
        // TODO
    }
    
    func _remove_child_view_controller(_ childController: UIViewController) {
        let index = _child_view_controllers.firstIndex(of: childController)
        if index != nil {
            _child_view_controllers.remove(at: index!)
            childController.parentViewController = nil
        }
    }

    // removeFromParentViewController()
    // {
    //     this.parent.removeChildViewController(this);
    //     this.parent = null;
    //     this.view.removeFromSuperview();
    //     //this.didMoveToParentViewController(null);
    // }

    var _presentation_controller: UIPresentationController? = nil
    var isPresented:Bool { get {
        return _presentation_controller != nil ? _presentation_controller!._is_presented : false
    } }

    var presentationController: UIPresentationController { get {
        // if (this._presentationController == null && this.parentViewController != null)
        //     return this.parentViewController.presentationController;

        return _presentation_controller!
    } }

    var _popover_presentation_controller: UIPopoverPresentationController? = nil
    var popoverPresentationController: UIPopoverPresentationController { get {
        if _popover_presentation_controller == nil {
            _popover_presentation_controller = UIPopoverPresentationController()
//            _popover_presentation_controller.presentedViewController = self
            _presentation_controller = _popover_presentation_controller
        }

        return _popover_presentation_controller!
    } }

    func showViewController(_ viewController:UIViewController, animated:Bool) {
        
        viewController._on_load_view { viewController in

            view.addSubview(viewController.view)
            addChild(viewController)

//            _MUIShowViewController(this, vc, this, animated);
        }
    }

    func present(_ viewController: UIViewController, animated: Bool) {

//        var pc = viewController.presentationController as? UIPresentationController
//        if pc == nil {
//            pc = UIPresentationController()
//            pc!.presentedViewController = viewController
//            pc!.presentingViewController = self
//            viewController._presentation_controller = pc
//        }
//
//        if pc.presentingViewController == nil {
//            pc.presentingViewController = self
//        }
//
//        if pc!._is_presented == true {
//            throw Error("You try to present a view controller that is already presented")
//        }

        // if (vc.modalPresentationStyle == UIModalPresentationStyle.CurrentContext){
        //     vc.modalPresentationStyle = MIOCoreIsPhone() == true ? UIModalPresentationStyle.FullScreen : UIModalPresentationStyle.PageSheet;
        // }

        // if (vc.modalPresentationStyle != UIModalPresentationStyle.FullScreen
        //     && vc.modalPresentationStyle != UIModalPresentationStyle.FormSheet
        //     && vc.modalPresentationStyle != UIModalPresentationStyle.PageSheet
        //     && vc.modalPresentationStyle != UIModalPresentationStyle.Popover
        //     && vc.modalPresentationStyle != UIModalPresentationStyle.Custom)
        //     vc.modalPresentationStyle = UIModalPresentationStyle.PageSheet;

//        viewController._on_load_view { vc in
//
//            if vc.modalPresentationStyle == .currentContext {
//                let wv = UIView()
//                view.addSubview(wv)
//                wv.addSubview(vc.presentationController.presentedView)
//                this.addChild( vc )º1
//                _MUIShowViewController(this, vc,       , animated, this, function () {
//                });
//            }
//            else {
//                // It's a window instead of a view
//                let w: UIWindow = vc.presentationController.window;
//                if (w == null) {
//                    w = new UIWindow();
//                    w.init();
//                    w.layer.style.background = "";
//                    w.layer.style.width = "100%";
//                    w.layer.style.height = "100%";
//                    w.rootViewController = vc;
//                    vc.presentationController.presentedView = vc.view;
//                    vc.view.layer.style.width = "100%";
//                    vc.view.layer.style.height = "100%";
//                    w.addSubview(vc.presentationController.presentedView);
//                    vc.presentationController.window = w;
//                }
//                w.setHidden(false);
//                if (vc instanceof UIAlertController) MUICoreLayerAddStyle(w.layer, "alert");
//
//                _MUIShowViewController(this, vc, null, animated, this, function () {
//                    w.makeKey();
//                });
//            }
//        });
    }

    public func dismissViewController( animate: Bool) {
        let pc = _presentation_controller
        let vc = this as UIViewController
        while (pc == nil) {
            vc = vc.parentViewController;
            pc = vc._presentationController;
        }
        let toVC = pc.presentingViewController;
        let fromVC = pc.presentedViewController;
        let fromView = pc.presentedView;

//        _MUIHideViewController(fromVC, toVC, null, this, function () {
//
//            if (fromVC.modalPresentationStyle == UIModalPresentationStyle.currentContext) {
//                toVC.removeChildViewController(fromVC);
//                let pc1 = fromVC.presentationController;
//                let view = pc1.presentedView;
//                view.removeFromSuperview();
//            }
//            else {
//                // It's a window instead of a view
//                let pc1 = fromVC.presentationController;
//                let w = pc1.window as UIWindow;
//                w.setHidden(true);
//            }
//        });
    }

//    transitionFromViewControllerToViewController(fromVC, toVC, duration, options, animations?, completion?) {
//        //TODO
//    }

    public func viewDidLoad() { }

    public func viewWillAppear(animated: Bool) {
//        for (var index = 0; index < this._childViewControllers.length; index++) {
//            var vc = this._childViewControllers[index];
//            vc.viewWillAppear(animated);
//        }
//
//        this.view.setViewIsVisible(true);
    }

    public func viewDidAppear(animated: Bool) {
        //this.view.setNeedsDisplay();

//        for (var index = 0; index < this._childViewControllers.length; index++) {
//            var vc = this._childViewControllers[index];
//            vc.viewDidAppear(animated);
//        }
    }

    public func viewWillDisappear(animated:Bool) {
//        for (var index = 0; index < this._childViewControllers.length; index++) {
//            var vc = this._childViewControllers[index];
//            vc.viewWillDisappear(animated);
//        }
//
//        this.view.setViewIsVisible(false);
    }

    viewDidDisappear(animated?) {
        for (var index = 0; index < this._childViewControllers.length; index++) {
            var vc = this._childViewControllers[index];
            vc.viewDidDisappear(animated);
        }
    }

    contentHeight() {
        return this.view.getHeight();
    }

    setContentSize(size) {
        this.willChangeValue("contentSize");
        this._contentSize = size;
        this.didChangeValue("contentSize");
    }

    public set contentSize(size) {
        this.setContentSize(size);
    }

    public get contentSize() {
        return this._contentSize;
    }

    public set preferredContentSize(size) {
        this.setPreferredContentSize(size);
    }

    public get preferredContentSize() {
        return this._preferredContentSize;
    }

    setPreferredContentSize(size) {
        this.willChangeValue("preferredContentSize");
        this._preferredContentSize = size;
        this.didChangeValue("preferredContentSize");
    }

    // Storyboard
    storyboard:UIStoryboard = null;
    _outlets = {};
    _segues = [];

    _checkSegues() {

    }

    shouldPerformSegueWithIdentifier(identifier:string, sender:any):Boolean{
        return true;
    }

    prepareForSegue(segue:UIStoryboardSegue, sender:any){

    }

    performSegueWithIdentifier(identifier:string, sender:any){

    }
}

