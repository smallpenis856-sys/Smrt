.class Lginlemon/flower/glance/SLGlanceIsland$12;
.super Ljava/lang/Object;
.source "SLGlanceIsland.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lginlemon/flower/glance/SLGlanceIsland;->addRow(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lginlemon/flower/glance/SLGlanceIsland;

.field final synthetic val$action:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lginlemon/flower/glance/SLGlanceIsland;Ljava/lang/Runnable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 332
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$12;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    iput-object p2, p0, Lginlemon/flower/glance/SLGlanceIsland$12;->val$action:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .prologue
    .line 332
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$12;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$1700(Lginlemon/flower/glance/SLGlanceIsland;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$12;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$1700(Lginlemon/flower/glance/SLGlanceIsland;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_11
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$12;->val$action:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method
