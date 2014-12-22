<?php
/**
 * Routes.
 *
 * @copyright Zikula contributors (Zikula)
 * @license http://www.gnu.org/licenses/lgpl.html GNU Lesser General Public License
 * @author Zikula contributors <support@zikula.org>.
 * @link http://www.zikula.org
 * @link http://zikula.org
 * @version Generated by ModuleStudio 0.7.0 (http://modulestudio.de).
 */

namespace Zikula\RoutesModule\Listener\Base;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpKernel\HttpKernelInterface;
use Zikula\Core\Event\GenericEvent;

/**
 * Event handler base class for view-related events.
 */
class ViewListener implements EventSubscriberInterface
{
    /**
     * Makes our handlers known to the event system.
     */
    public static function getSubscribedEvents()
    {
        return array(
            'view.init'      => array('init', 5),
            'view.postfetch' => array('postFetch', 5)
        );
    }

    /**
     * Listener for the `view.init` event.
     *
     * Occurs just before `Zikula_View#__construct()` finishes.
     * The subject is the Zikula_View instance.
     *
     * @param GenericEvent $event The event instance.
     */
    public function init(GenericEvent $event)
    {
    }

    /**
     * Listener for the `view.postfetch` event.
     *
     * Filter of result of a fetch.
     * Receives `Zikula_View` instance as subject,
     * args are `array('template' => $template)`,
     * $data was the result of the fetch to be filtered.
     *
     * @param GenericEvent $event The event instance.
     */
    public function postFetch(GenericEvent $event)
    {
    }
}
