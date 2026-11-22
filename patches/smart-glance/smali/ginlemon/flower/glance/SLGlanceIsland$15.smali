.class Lginlemon/flower/glance/SLGlanceIsland$15;
.super Ljava/lang/Object;
.source "SLGlanceIsland.java"

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lginlemon/flower/glance/SLGlanceIsland;->showSettings()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lginlemon/flower/glance/SLGlanceIsland;

.field final synthetic val$values:[Z


# direct methods
.method constructor <init>(Lginlemon/flower/glance/SLGlanceIsland;[Z)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 343
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$15;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    iput-object p2, p0, Lginlemon/flower/glance/SLGlanceIsland$15;->val$values:[Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .registers 5

    .prologue
    .line 343
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$15;->val$values:[Z

    aput-boolean p3, v0, p2

    return-void
.end method
